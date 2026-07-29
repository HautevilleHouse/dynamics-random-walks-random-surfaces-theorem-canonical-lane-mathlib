import canonicalLaneMathlib.AdmissibleClass
import DynamicsRandomWalksRandomSurfacesTheoremCanonicalLaneLean.ScalingLimitConvergence

namespace HautevilleHouse
namespace DynamicsRandomWalksRandomSurfacesTheoremCanonicalLaneLean

structure LiouvillePropertyPackage {K : RandomWalkKernelPackage}
    {H : RandomSurfaceHeightPackage K}
    {S : ScalingLimitConvergencePackage K H} where
  harmonicFunctionsCharacterization : Prop
  dimensionTwoCriticality : Prop
  almostSureConstancy : Prop

structure LiouvillePropertyEvidence {K : RandomWalkKernelPackage}
    {H : RandomSurfaceHeightPackage K}
    {S : ScalingLimitConvergencePackage K H}
    (L : LiouvillePropertyPackage K H S) where
  harmonicFunctionsCharacterizationClosed : L.harmonicFunctionsCharacterization
  dimensionTwoCriticalityClosed : L.dimensionTwoCriticality
  almostSureConstancyClosed : L.almostSureConstancy

def LiouvillePropertyClosed {K : RandomWalkKernelPackage}
    {H : RandomSurfaceHeightPackage K}
    {S : ScalingLimitConvergencePackage K H}
    (L : LiouvillePropertyPackage K H S) : Prop :=
  L.harmonicFunctionsCharacterization ∧ L.dimensionTwoCriticality ∧ L.almostSureConstancy

theorem liouville_property_closed_from_evidence {K : RandomWalkKernelPackage}
    {H : RandomSurfaceHeightPackage K}
    {S : ScalingLimitConvergencePackage K H}
    (L : LiouvillePropertyPackage K H S) (E : LiouvillePropertyEvidence L) :
    LiouvillePropertyClosed L := by
  exact And.intro E.harmonicFunctionsCharacterizationClosed
    (And.intro E.dimensionTwoCriticalityClosed E.almostSureConstancyClosed)

end DynamicsRandomWalksRandomSurfacesTheoremCanonicalLaneLean
end HautevilleHouse