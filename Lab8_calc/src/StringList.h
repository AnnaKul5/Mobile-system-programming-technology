#ifndef STRINGLIST_H
#define STRINGLIST_H

#include <QObject>
#include <QString>

class StringList : public QObject
{
    Q_OBJECT
public:
//    explicit StringList(QObject *parent = nullptr);
    StringList() {}
    Q_INVOKABLE void add(QString temp) { m_data << temp; };
    Q_INVOKABLE void popBack()
    {
        if (!m_data.isEmpty()) {
            m_data.pop_back();
        }
    };

    Q_INVOKABLE QString getAll()
    {
        QString temp;
        for (int i = 0; i < m_data.length(); i++)
        {
            if (i == 0) {
                QString t = m_data[i];
                t[0] = t[0].toUpper();
                temp += t;
            } else {
                temp += m_data[i].toLower();
            }

            if (i != m_data.length()-1){
                temp += ", ";
            }
        }

        return temp;
    };
private:
    QList<QString> m_data;
};

#endif // STRINGLIST_H
