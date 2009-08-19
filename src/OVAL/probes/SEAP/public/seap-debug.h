#pragma once
#ifndef SEAP_DEBUG_H
#define SEAP_DEBUG_H

#include <assert.h>
#ifndef _A
#define _A(x) assert(x)
#endif

#ifndef _D
#if defined(NDEBUG)
# define _D(...) while(0)
#else
# include <stddef.h>
# include <stdarg.h>
void __seap_debuglog (const char *, const char *, size_t , const char *, ...);
# define _D(...) __seap_debuglog (__FILE__, __PRETTY_FUNCTION__, __LINE__, __VA_ARGS__)
#endif /* NDEBUG */
#endif /* _D */
#endif /* SEAP_DEBUG_H */
