import canonicalLaneMathlib.AdmissibleClass
import DynamicsRandomWalksRandomSurfacesTheoremCanonicalLaneLean.BridgeLemmas
import DynamicsRandomWalksRandomSurfacesTheoremCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace DynamicsRandomWalksRandomSurfacesTheoremCanonicalLaneLean

def ConstrainedDynamicsRandomWalksRandomSurfacesClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_dynamics_random_walks_random_surfaces_endgame (A : AdmissibleClass) :
    ConstrainedDynamicsRandomWalksRandomSurfacesClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end DynamicsRandomWalksRandomSurfacesTheoremCanonicalLaneLean
end HautevilleHouse
