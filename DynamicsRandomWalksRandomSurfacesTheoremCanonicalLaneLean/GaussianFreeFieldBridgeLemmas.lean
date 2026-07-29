import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicsRandomWalksRandomSurfacesTheoremCanonicalLaneLean.GaussianFreeFieldRoughness

namespace HautevilleHouse
namespace DynamicsRandomWalksRandomSurfacesTheoremCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  GaussianFreeFieldRoughnessClosed (A.object : GaussianFreeFieldRoughness)

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  exact A.object.evidence

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) : gateClosed A := by
  exact A.gateWitness

end DynamicsRandomWalksRandomSurfacesTheoremCanonicalLaneLean
end HautevilleHouse