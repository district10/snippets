inline std::string to_string(int v)
{
    char buffer[64] = {};
#if (defined(_MSC_VER) && _MSC_VER < 1900)
    sprintf_s(buffer, "%d", v);
#else
    snprintf(buffer, 64, "%d", v);
#endif
    return buffer;
}
