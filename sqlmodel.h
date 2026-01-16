#ifndef SQLMODEL_H
#define SQLMODEL_H

#include <QObject>
#include <QSqlQueryModel>

class SqlModel : public QSqlQueryModel {
    Q_OBJECT
public:
    explicit SqlModel(QObject *parent = nullptr);

    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;
    QHash<int, QByteArray> roleNames() const override;

    void setQueryString(const QString &query);
private:
    QHash<int, QByteArray> m_roleNames;
};
#endif // ZAKNAVDATA_H
