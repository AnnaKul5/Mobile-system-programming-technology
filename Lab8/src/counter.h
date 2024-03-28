#ifndef COUNTER_H
#define COUNTER_H

#include <QObject>
#include <QString>

class Counter : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int count READ getCount WRITE setCount NOTIFY countChanged)
public:
    explicit Counter(QObject *parent = nullptr);
    Q_INVOKABLE int getCount() { return count; };
    Q_INVOKABLE void inc() { count++; };
    Q_INVOKABLE void reset() { count = 0; };

    void setCount(const int temp) { count = temp; emit countChanged();};

signals:
    void countChanged();


private:
    int count = 0;
};

#endif // COUNTER_H
