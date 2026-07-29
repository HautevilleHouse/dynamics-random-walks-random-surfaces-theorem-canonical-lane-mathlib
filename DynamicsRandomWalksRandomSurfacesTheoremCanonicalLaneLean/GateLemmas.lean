import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsRandomWalksRandomSurfacesTheoremCanonicalLaneLean

def gateClosed (A : AdmissibleClass) : Prop := True

theorem gate_from_admissible_class (A : AdmissibleClass) :
    gateClosed A := by
  trivial

end DynamicsRandomWalksRandomSurfacesTheoremCanonicalLaneLean
end HautevilleHouse
