#include "loadcheck.h"

LoadCheck::LoadCheck(QObject *parent)
    : QObject(parent),
      has_error_(false)
{

}

LoadCheck::~LoadCheck()
{

}

bool LoadCheck::HasError() const
{
    return has_error_;
}

void LoadCheck::ComponentStatusChanged(QObject* result, const QUrl&)
{
    if(!result)
        has_error_ = true;
}
