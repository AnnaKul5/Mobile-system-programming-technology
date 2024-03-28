#ifndef CALC_H
#define CALC_H

#include <QObject>
#include <QString>

class Calc : public QObject
{
    Q_OBJECT
    Q_PROPERTY(double m_num_1 READ getNum1 WRITE setNum1 NOTIFY num1Changed)
    Q_PROPERTY(double m_num_2 READ getNum2 WRITE setNum2 NOTIFY num2Changed)
    Q_PROPERTY(double m_num_3 READ getNum3 WRITE setNum3 NOTIFY num3Changed)
    Q_PROPERTY(double m_num_4 READ getNum4 WRITE setNum4 NOTIFY num4Changed)

public:
//    explicit Calc(QObject *parent = nullptr);
    Calc(){}
    Q_INVOKABLE int getNum1() { return m_num_1; };
    Q_INVOKABLE int getNum2() { return m_num_2; };
    Q_INVOKABLE int getNum3() { return m_num_3; };
    Q_INVOKABLE int getNum4() { return m_num_4; };

    Q_INVOKABLE int add_1() { return m_num_1 + m_num_3; };
    Q_INVOKABLE int add_2() { return m_num_2 + m_num_4; };
    Q_INVOKABLE int sub1() { return m_num_1 - m_num_3; };
    Q_INVOKABLE int div1() { return (m_num_1 * m_num_3 + m_num_2 * m_num_4)/(m_num_3*m_num_3 + m_num_4*m_num_4); };
    Q_INVOKABLE int mul1() { return m_num_1 * m_num_3 - m_num_2 * m_num_4; };
    Q_INVOKABLE int sub2() { return m_num_2 - m_num_4; };
    Q_INVOKABLE int div2() { return (m_num_2* m_num_3 - m_num_1 * m_num_4)/(m_num_3*m_num_3 + m_num_4*m_num_4);  };
    Q_INVOKABLE int mul2() { return m_num_1 * m_num_4 + m_num_2 * m_num_3; };

    void setNum1(const int temp) { m_num_1 = temp; emit num1Changed(); };
    void setNum2(const int temp) { m_num_2 = temp; emit num2Changed(); };
    void setNum3(const int temp) { m_num_3 = temp; emit num1Changed(); };
    void setNum4(const int temp) { m_num_4 = temp; emit num2Changed(); };

signals:
    void num1Changed();
    void num2Changed();
    void num3Changed();
    void num4Changed();

private:
    double m_num_1 = 0; //a
    double m_num_2 = 0; //b
    double m_num_3 = 0; //c
    double m_num_4 = 0; //d

};

#endif // CALC_H
