// ----------------------------------------------------------------
// Gunrock -- Fast and Efficient GPU Graph Library
// ----------------------------------------------------------------
// This source code is distributed under the terms of LICENSE.TXT
// in the root directory of this source distribution.
// ----------------------------------------------------------------

/**
 * @file
 * types.cuh
 *
 * @brief data types and limits defination
 */

#pragma once

#include <cstring>
#include <float.h>
#include <string>
#include <vector>
#include <typeindex>
#include <sstream>

namespace gunrock {
namespace util {

// Ensure no un-specialized types will be compiled
extern __device__ __host__ void Error_UnsupportedType();

template <typename T>
__device__ __host__ __forceinline__ T MaxValue() {
  Error_UnsupportedType();
  return 0;
}

template <>
__device__ __host__ __forceinline__ int MaxValue<int>() {
  return INT_MAX;
}

template <>
__device__ __host__ __forceinline__ float MaxValue<float>() {
  return FLT_MAX;
}

template <>
__device__ __host__ __forceinline__ long long MaxValue<long long>() {
  return LLONG_MAX;
}

template <typename T>
__device__ __host__ __forceinline__ T MinValue() {
  Error_UnsupportedType();
  return 0;
}

template <>
__device__ __host__ __forceinline__ int MinValue<int>() {
  return INT_MIN;
}

template <>
__device__ __host__ __forceinline__ float MinValue<float>() {
  return FLT_MIN;
}

template <>
__device__ __host__ __forceinline__ long long MinValue<long long>() {
  return LLONG_MIN;
}

/*template <typename T, size_t SIZE>
__device__ __host__ __forceinline__ T AllZeros_N()
{
    Error_UnsupportedSize();
    return 0;
}

template <typename T>
__device__ __host__ __forceinline__ T AllZeros_N<T, 4>()
{
    return (T)0x00000000;
}

template <typename T>
__device__ __host__ __forceinline__ T AllZeros_N<T, 8>()
{
    return (T)0x0000000000000000;
}*/

template <typename T>
__device__ __host__ __forceinline__ T AllZeros() {
  // return AllZeros_N<T, sizeof(T)>();
  Error_UnsupportedType();
  return 0;
}

template <>
__device__ __host__ __forceinline__ int AllZeros<int>() {
  return (int)0x00000000;
}

template <>
__device__ __host__ __forceinline__ long long AllZeros<long long>() {
  return (long long)0x0000000000000000LL;
}

/*template <typename T, size_t SIZE>
__device__ __host__ __forceinline__ T AllOnes_N()
{
    Error_UnsupportedSize();
    return 0;
}

template <typename T>
__device__ __host__ __forceinline__ T AllOnes_N<T, 4>()
{
    return (T)0xFFFFFFFF;
}

template <typename T>
__device__ __host__ __forceinline__ T AllOnes_N<T, 8>()
{
    return (T)0xFFFFFFFFFFFFFFFF;
}*/

template <typename T>
__device__ __host__ __forceinline__ T AllOnes() {
  // return AllOnes_N<T, sizeof(T)>();
  Error_UnsupportedType();
  return 0;
}

template <>
__device__ __host__ __forceinline__ int AllOnes<int>() {
  return (int)0xFFFFFFFF;
}

template <>
__device__ __host__ __forceinline__ long long AllOnes<long long>() {
  return (long long)0xFFFFFFFFFFFFFFFFLL;
}

template <>
__device__ __host__ __forceinline__ unsigned char AllOnes<unsigned char>() {
  return (unsigned char)0xFF;
}

template <typename T>
__device__ __host__ __forceinline__ T InvalidValue() {
  // return AllOnes_N<T, sizeof(T)>();
  Error_UnsupportedType();
  return 0;
}

template <>
__device__ __host__ __forceinline__ int InvalidValue<int>() {
  return (int)-1;
}

template <>
__device__ __host__ __forceinline__ long long InvalidValue<long long>() {
  return (long long)-1;
}

template <typename T>
__device__ __host__ __forceinline__ bool isValid(T val) {
  return val >= 0;  //(val != InvalidValue<T>());
}

template <typename T, int SIZE>
struct VectorType { /*typedef UnknownType Type;*/
};
template <>
struct VectorType<int, 1> {
  typedef int Type;
};
template <>
struct VectorType<int, 2> {
  typedef int2 Type;
};
template <>
struct VectorType<int, 3> {
  typedef int3 Type;
};
template <>
struct VectorType<int, 4> {
  typedef int4 Type;
};
template <>
struct VectorType<long long, 1> {
  typedef long long Type;
};
template <>
struct VectorType<long long, 2> {
  typedef longlong2 Type;
};
template <>
struct VectorType<long long, 3> {
  typedef longlong3 Type;
};
template <>
struct VectorType<long long, 4> {
  typedef longlong4 Type;
};

std::string TypeName(const std::type_info *t_info);

template <typename T>
T strtoT_simple(const char *str, char **str_end, int base = 0) {
  Error_UnsupportedType();
}

template <>
long strtoT_simple<long>(const char *str, char **str_end, int base);
template <>
unsigned long strtoT_simple<unsigned long>(const char *str, char **str_end,
                                           int base);
template <>
long long strtoT_simple<long long>(const char *str, char **str_end, int base);
template <>
unsigned long long strtoT_simple<unsigned long long>(const char *str,
                                                     char **str_end, int base);
template <>
char strtoT_simple<char>(const char *str, char **str_end, int base);
template <>
signed char strtoT_simple<signed char>(const char *str, char **str_end,
                                       int base);
template <>
unsigned char strtoT_simple<unsigned char>(const char *str, char **str_end,
                                           int base);
template <>
short strtoT_simple<short>(const char *str, char **str_end, int base);
template <>
unsigned short strtoT_simple<unsigned short>(const char *str, char **str_end,
                                             int base);
template <>
int strtoT_simple<int>(const char *str, char **str_end, int base);
template <>
unsigned int strtoT_simple<unsigned int>(const char *str, char **str_end,
                                         int base);
template <>
float strtoT_simple<float>(const char *str, char **str_end, int base);
template <>
double strtoT_simple<double>(const char *str, char **str_end, int base);
template <>
long double strtoT_simple<long double>(const char *str, char **str_end,
                                       int base);
template <>
bool strtoT_simple<bool>(const char *str, char **str_end, int base);
template <>
char *strtoT_simple<char *>(const char *str, char **str_end, int base);
template <>
std::string strtoT_simple<std::string>(const char *str, char **str_end,
                                       int base);

template <typename T, bool is_vector>
class VT_Selector {};

template <typename T>
class VT_Selector<T, true> {
 public:
  static T strtoT(const char *str, char **str_end, int base = 0) {
    typedef typename T::value_type Value_Type;
    T vec;
    unsigned int length = strlen(str);
    *str_end = const_cast<char *>(str) + length;
    char *temp_str = new char[length + 1];
    std::strncpy(temp_str, str, length + 1);
    for (unsigned int i = 0; i < length; i++) {
      if (str[i] == ',') temp_str[i] = '\0';
    }

    char *item_end;
    Value_Type val;
    // std::cout << "Testing " << temp_str << std::endl;
    val = strtoT_simple<Value_Type>(temp_str, &item_end, base);
    vec.push_back(val);
    if (*item_end != '\0') {
      *str_end = const_cast<char *>(str) + (item_end - temp_str);
    } else {
      for (unsigned int i = 0; i < length; i++) {
        if (str[i] != ',') continue;
        // std::cout << "Testing " << temp_str + i + 1<< std::endl;
        val = strtoT_simple<Value_Type>(temp_str + i + 1, &item_end, base);
        vec.push_back(val);
        if (*item_end != '\0') {
          // std::cout << item_end - temp_str << "|" << int(*item_end) <<
          // std::endl;
          *str_end = const_cast<char *>(str) + (item_end - temp_str);
          break;
        }
      }
    }
    delete[] temp_str;
    temp_str = NULL;
    return vec;
  }
};

template <typename T>
class VT_Selector<T, false> {
 public:
  static T strtoT(const char *str, char **str_end, int base = 0) {
    return strtoT_simple<T>(str, str_end, base);
  }
};

template <typename>
struct IS_VECTOR : std::false_type {};

template <typename T, typename A>
struct IS_VECTOR<std::vector<T, A>> : std::true_type {};

bool isVector(const std::type_info *t_info);
const std::type_info *toVector(const std::type_info *t_info);

template <typename T>
T strtoT(const char *str, char **str_end, int base = 0) {
  return VT_Selector<T, IS_VECTOR<T>::value>::strtoT(str, str_end, base);
}

template <typename T>
T strtoT(const std::string str, std::string &str_end, int base = 0) {
  char *char_str_end;
  T val = strtoT<T>(str.c_str(), &char_str_end, base);
  str_end = std::string((char_str_end == NULL) ? "" : char_str_end);
  return val;
}

template <typename T>
bool isValidString(const char *str, int base = 0) {
  char *str_end;
  strtoT<T>(str, &str_end, base);

  if (*str_end == '\0') return true;
  // std::cout << str_end - str << "|" << int(*str_end) << std::endl;
  return false;
}

template <typename T>
bool isValidString(const std::string str, int base = 0) {
  return isValidString<T>(str.c_str(), base);
}

bool isValidString(const char *str, const std::type_info *t_info, int base = 0);
bool isValidString(const std::string str, const std::type_info *t_info,
                   int base = 0);

}  // namespace util
}  // namespace gunrock

// enable stream to process vectors
template <typename T>
std::ostream &operator<<(std::ostream &sout, const std::vector<T> &vec) {
  bool first_element = true;
  for (auto item : vec) {
    sout << std::string(first_element ? "" : ",") << item;
    first_element = false;
  }
  return sout;
}

template <>
std::ostream &operator<<(std::ostream &sout, const std::vector<bool> &vec);

template <typename T>
std::istream &operator>>(std::istream &s_in, std::vector<T> &vec) {
  vec.clear();
  std::string str = "", item = "";
  s_in >> str;
  for (unsigned int i = 0; i < str.length(); i++) {
    if (str[i] == ',') {
      std::istringstream istr(item);
      T val;
      istr >> val;
      vec.push_back(val);
      item = "";
    } else
      item = item + str[i];
  }

  std::istringstream istr(item);
  T val;
  istr >> val;
  vec.push_back(val);
  item = "";

  return s_in;
}

template <>
std::istream &operator>>(std::istream &s_in, std::vector<bool> &vec);

// Leave this at the end of the file
// Local Variables:
// mode:c++
// c-file-style: "NVIDIA"
// End:
