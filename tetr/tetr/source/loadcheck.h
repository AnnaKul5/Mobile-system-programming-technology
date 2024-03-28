#ifndef LOADCHECK_H
#define LOADCHECK_H

#include <QObject>

class LoadCheck : public QObject
{
    Q_OBJECT
public:
    explicit LoadCheck(QObject *parent = 0);
    ~LoadCheck();

    bool HasError() const;

signals:

public slots:
    void ComponentStatusChanged(QObject* result, const QUrl&);

private:
    bool has_error_;
};

#endif // LOADCHECK_H
