#include <memory>
class A {
    public:
        A(int* a, int* b) : a_(a), b_(b) {}
        int* geta() {return a_;}
        int* getb() {return b_;}
    
    private:
        int* a_;
        int* b_;
    };
    
    void test() {
        int* ux;
        *ux = 10;
        int* uy;
        *uy = 20;
        auto uptr = std::make_unique<A>(ux, uy); // Data flow from ux -> a_ and uy -> b_
        int* um = uptr->geta();
        int* un = uptr->getb();
        int uk = *um + *un;
    }
    
    int main() {
        test();
        return 0;
    }
    
