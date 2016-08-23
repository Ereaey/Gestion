#ifndef TREEITEM_H
#define TREEITEM_H

#include <QObject>

class TreeItem : public QObject
{
    Q_OBJECT
public:
    explicit TreeItem(QString content, QObject *parent = 0);

    Q_PROPERTY(QString content READ content NOTIFY contentChanged)
    const QString & content() const;
    void setContent(const QString & content);

    Q_PROPERTY(QList<QObject*> childItems READ childItemsAsQObject NOTIFY childItemsChanged)
    const QList<TreeItem *> &childItems() const;
    const QList<QObject *> childItemsAsQObject() const;
    void addChildItem(TreeItem * childItem);

    Q_PROPERTY(bool isOpen READ isOpen WRITE setIsOpen NOTIFY isOpenChanged)
    bool isOpen() const;
    void setIsOpen(bool isOpen);

    Q_PROPERTY(bool isSelect READ isSelect WRITE setIsSelect NOTIFY isSelectChanged)
    bool isSelect() const;
    void setIsSelect(bool isSelect);

    Q_PROPERTY(bool hasChild READ hasChild NOTIFY hasChildChanged)
    bool hasChild() const;
signals:
    void contentChanged();
    void childItemsChanged();
    void isOpenChanged();
    void isSelectChanged();
    void hasChildChanged();
public slots:
private:
    QString m_content;
    QList<TreeItem *> m_childItems;
    bool m_isOpen;
    bool m_isSelect;
};

#endif // TREEITEM_H
