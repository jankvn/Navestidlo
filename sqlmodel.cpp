#include "sqlmodel.h"
#include <QSqlRecord>

SqlModel::SqlModel(QObject *parent)
    : QSqlQueryModel(parent)
{
}

QVariant SqlModel::data(const QModelIndex &index, int role) const {
    if (role < Qt::UserRole)
        return QSqlQueryModel::data(index, role);

    int columnIdx = role - Qt::UserRole;
    return QSqlQueryModel::data(this->index(index.row(), columnIdx));
}

QHash<int, QByteArray> SqlModel::roleNames() const {
    QHash<int, QByteArray> roles;
    for (int i = 0; i < this->record().count(); ++i) {
        QString fieldName = this->record().fieldName(i);
        roles[Qt::UserRole + i] = QByteArray(fieldName.toUtf8());
    }
    return roles;
}

void SqlModel::setQueryString(const QString &query) {
    this->setQuery(query);
    m_roleNames.clear(); // Rebuild roleNames on new query
}
