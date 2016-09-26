#include "treatment.h"
#include <QDebug>

Treatment::Treatment(Data *d)
{
    m_data = d;
    m_finish = false;
    m_type = SEARCH_GOAL;
    m_goal = "";
    m_domaine = "";
    m_descriptionResult = new DataDomaine("", "");
}

void Treatment::load()
{
    foreach (QString key, m_data->getCommus().keys()) {
        m_commu.append(new DataCommu(key, 0));
        setCommu(key);
    }
}

void Treatment::searchGoal(QString goal, bool modificateur, bool lecteur)
{
    m_goal = goal;
    m_currentAction = "Rechercher un goal > " + goal;
    if (modificateur == true && lecteur == false)
    {
        m_type = SEARCH_GOAL_MODIF;
        m_currentAction += " (M)";
    }
    else if (modificateur == false && lecteur == true)
    {
        m_type == SEARCH_GOAL_LECT;
        m_currentAction += " (L)";
    }
    else if (modificateur == true && lecteur == true)
    {
        m_type = SEARCH_GOAL;
        m_currentAction += " (M/L)";
    }
    else
    {
        m_type = SEARCH_GOAL;
        m_currentAction = "Rechercher un goal";
        m_goal = "";
    }
    emit currentActionChanged();

    start();
}

void Treatment::searchGoalsVide()
{
    m_currentAction = "Rechercher un goal vide";
    emit currentActionChanged();
    m_type = SEARCH_GOAL_VIDE;
    start();
}

void Treatment::searchGoalsProbleme()
{
    m_currentAction = "Rechercher un goal inexistants / périmés";
    emit currentActionChanged();
    m_type = SEARCH_GOAL_PROBLEME;
    start();
}

void Treatment::searchDomaine(QString name)
{
    m_currentAction = "Rechercher un domaine > " + name;
    m_domaine = name;
    emit currentActionChanged();
    m_type = SEARCH_DOMAINE;
    start();
}

void Treatment::searchDomaineVide()
{
    m_currentAction = "Rechercher des domaines vides";
    //m_domaine = name;
    emit currentActionChanged();
    m_type = SEARCH_DOMAINE_VIDE;
    start();
}

void Treatment::searchDomaineFull()
{
    m_currentAction = "Rechercher des domaines surchargés";
    //m_domaine = name;
    emit currentActionChanged();
    m_type = SEARCH_DOMAINE_FULL;
    start();
}

bool Treatment::finish() const
{
    return m_finish;
}

void Treatment::setCommu(QString name)
{
    m_currentCommu = name;
    m_data->setCurrentCommu(name);
    emit commuChanged();
    start();
}

void Treatment::exportPlan(QString idDomaine, QString path)
{
    path.remove("file:///");
    path.remove("file:\\\/");

    m_currentAction = "Exportation du plan";
    m_domaine = idDomaine;
    m_path = path;
    emit currentActionChanged();
    m_type = EXPORT_PLAN;
    start();
}

QString Treatment::generatePlan(QString idDomaine)
{
    QString d;

    d += "[\"" + QString::number(m_data->getCurrentCommu()->domainesKey[idDomaine]->id) + "\", \""
            + m_data->getCurrentCommu()->domainesKey[idDomaine]->nom + "\", \""
            + QString::number(m_data->getCurrentCommu()->domainesKey[idDomaine]->enfants.size()) + "\", \""
            + QString::number(m_data->getCurrentCommu()->domainesKey[idDomaine]->documents.size()) + "\", \""
            + QString::number(m_data->getCurrentCommu()->domainesKey[idDomaine]->id_parent) + "\", \""
            + m_data->getCurrentCommu()->domainesKey[idDomaine]->responsable->user->nom + " " + m_data->getCurrentCommu()->domainesKey[idDomaine]->responsable->user->prenom
            + "\"]";
    for (int i = 0; i < m_data->getCurrentCommu()->domainesKey[idDomaine]->enfants.size(); i++)
    {
         d += "," + generatePlan(QString::number(m_data->getCurrentCommu()->domainesKey[idDomaine]->enfants[i]->id));
    }

    for (int i = 0; i < m_data->getCurrentCommu()->domainesKey[idDomaine]->documents.size(); i++)
    {
         m_dataDocument += ", [\"" + m_data->getCurrentCommu()->domainesKey[idDomaine]->documents[i]->id + "\", \""
                 + m_data->getCurrentCommu()->domainesKey[idDomaine]->documents[i]->nom + "\", \""
                 + m_data->getCurrentCommu()->domainesKey[idDomaine]->documents[i]->version + "\", \""
                 + m_data->getCurrentCommu()->domainesKey[idDomaine]->documents[i]->domaine->nom + "\", \""
                 + m_data->getCurrentCommu()->domainesKey[idDomaine]->documents[i]->proprietaire->user->nom + " " + m_data->getCurrentCommu()->domainesKey[idDomaine]->documents[i]->proprietaire->user->prenom
                 + "\"]";
    }
    return d;
}


void Treatment::run()
{
    m_finish = false;
    emit finishChanged();
    if (m_type == SEARCH_GOAL)
    {
        m_data->drawTree(m_goal, true, true);
        for (int i = 0; i < m_commu.size(); i++)
        {
            ((DataCommu*)(m_commu[i]))->setResult(m_data->getCommus()[((DataCommu*)m_commu[i])->nom()]->domainesGoal[m_goal].size());
            if (m_goal.isEmpty())
                ((DataCommu*)(m_commu[i]))->setResult(0);
            qDebug() << QString::number(m_data->getCommus()[((DataCommu*)m_commu[i])->nom()]->domainesGoal[m_goal].size());
        }
    }
    else if (m_type == SEARCH_GOAL_MODIF)
    {
        m_data->drawTree(m_goal, true, false);
        for (int i = 0; i < m_commu.size(); i++)
        {
            ((DataCommu*)(m_commu[i]))->setResult(m_data->getCommus()[((DataCommu*)m_commu[i])->nom()]->domainesGoalModificateurs[m_goal].size());
            if (m_goal.isEmpty())
                ((DataCommu*)(m_commu[i]))->setResult(0);
        }
    }
    else if (m_type == SEARCH_GOAL_LECT)
    {
        m_data->drawTree(m_goal, false, true);
        for (int i = 0; i < m_commu.size(); i++)
        {
            ((DataCommu*)(m_commu[i]))->setResult(m_data->getCommus()[((DataCommu*)m_commu[i])->nom()]->domainesGoalLecteurs[m_goal].size());
            if (m_goal.isEmpty())
                ((DataCommu*)(m_commu[i]))->setResult(0);
        }
    }
    else if (m_type == SEARCH_GOAL_VIDE)
    {
        m_result.clear();
        for (int i = 0; i < m_commu.size(); i++)
        {
            ((DataCommu*)(m_commu[i]))->setResult(m_data->getCommus()[((DataCommu*)m_commu[i])->nom()]->goalsVides.size());
        }
        for (int i = 0; i < m_data->getCurrentCommu()->goalsVides.size(); i++)
        {
            m_result.append(new DataGoal(m_data->getCurrentCommu()->goalsVides[i]->nom, m_data->getCurrentCommu()->goalsVides[i]->ID));
        }
        emit refreshResult();
    }
    else if (m_type == SEARCH_DOMAINE)
    {
        m_data->drawTree(m_domaine);
        for (int i = 0; i < m_commu.size(); i++)
        {
            if (m_data->getCommus()[((DataCommu*)m_commu[i])->nom()]->domainesKey.contains(m_domaine))
            {
                ((DataCommu*)(m_commu[i]))->setResult(1);
                setCommu(((DataCommu*)m_commu[i])->nom());
                m_data->drawTree(m_domaine);
                Domaine *g = m_data->getCommus()[((DataCommu*)m_commu[i])->nom()]->domainesKey[m_domaine];
                DataDomaine *d = new DataDomaine(g->nom, QString::number(g->id), g->responsable->user->nom + " " + g->responsable->user->prenom);
                m_descriptionResult = d;
            }
            else
                ((DataCommu*)(m_commu[i]))->setResult(0);
        }
        emit refreshDescriptionResult();
        emit refreshResult();
    }
    else if (m_type == SEARCH_DOMAINE_VIDE)
    {
        m_result.clear();
        for (int i = 0; i < m_commu.size(); i++)
        {
            ((DataCommu*)(m_commu[i]))->setResult(m_data->getCommus()[((DataCommu*)m_commu[i])->nom()]->domainesVides.size());
        }
        for (int i = 0; i < m_data->getCurrentCommu()->domainesVides.size(); i++)
        {
            m_result.append(new DataDomaine(m_data->getCurrentCommu()->domainesVides[i]->nom, QString::number(m_data->getCurrentCommu()->domainesVides[i]->id)));
        }
        emit refreshResult();
    }
    else if (m_type == SEARCH_DOMAINE_FULL)
    {
        m_result.clear();
        for (int i = 0; i < m_commu.size(); i++)
        {
            ((DataCommu*)(m_commu[i]))->setResult(m_data->getCommus()[((DataCommu*)m_commu[i])->nom()]->domainesPlein.size());
        }
        for (int i = 0; i < m_data->getCurrentCommu()->domainesPlein.size(); i++)
        {
            m_result.append(new DataDomaine(m_data->getCurrentCommu()->domainesPlein[i]->nom, QString::number(m_data->getCurrentCommu()->domainesPlein[i]->id)));
        }
        emit refreshResult();
    }
    else if (m_type == SEARCH_GOAL_PROBLEME)
    {
        m_result.clear();
        for (int i = 0; i < m_commu.size(); i++)
        {
            ((DataCommu*)(m_commu[i]))->setResult(m_data->getCommus()[((DataCommu*)m_commu[i])->nom()]->goalsInexistants.size());
        }
        for (int i = 0; i < m_data->getCurrentCommu()->goalsInexistants.size(); i++)
        {
            m_result.append(new DataGoal(m_data->getCurrentCommu()->goalsInexistants[i]->nom, m_data->getCurrentCommu()->goalsInexistants[i]->ID, m_data->getCurrentCommu()->goalsInexistants[i]->etat));
        }
        emit refreshResult();
    }
    else if (m_type == EXPORT_PLAN)
    {
        QString data;
        m_dataDocument = "var documents = [A";
        data = "var domaines = [" + generatePlan(m_domaine) + "];";
        data.replace(QString::number(m_data->getCurrentCommu()->domainesKey[m_domaine]->id_parent), "");
        //qDebug() << data;
        QFile file(":/index.html");
        if (!file.open(QIODevice::ReadOnly | QIODevice::Text))
            return;
        QTextStream in(&file);
        QString de = in.readAll();
        de.replace("datadomaines", data);
        m_dataDocument += "];";
        m_dataDocument.remove("A,");
        de.replace("datadocuments", m_dataDocument);
        de.replace("xxxxxx", m_domaine);

        //qDebug() << de;
        QFile file2(m_path);
        if (!file2.open(QIODevice::WriteOnly | QIODevice::Text))
            return;

        QTextStream out(&file2);
        out << de;

        searchDomaine(m_domaine);
    }
    m_finish = true;
    emit finishChanged();
}
