#ifndef COUNTER_H
#define COUNTER_H

#include <QObject>
#include <QString>

class Counter : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int m_count READ getCount WRITE setCount NOTIFY countChanged)
public:
//    explicit Counter(QObject *parent = nullptr);
    Counter(){}
    Q_INVOKABLE int getCount() { return m_count; };
    Q_INVOKABLE void inc() { m_count++; emit countChanged(); };
    Q_INVOKABLE void reset() { m_count = 0; emit countChanged(); };

    Q_INVOKABLE void setCount(const int temp) { m_count = temp; emit countChanged(); };

signals:
    void countChanged();


private:
    int m_count = 0;
};

#endif // COUNTER_H
