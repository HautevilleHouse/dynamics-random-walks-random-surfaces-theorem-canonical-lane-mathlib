import canonicalLaneMathlib.AdmissibleClass
import DynamicsRandomWalksRandomSurfacesTheoremCanonicalLaneLean.LiouvilleProperty

namespace HautevilleHouse
namespace DynamicsRandomWalksRandomSurfacesTheoremCanonicalLaneLean

structure KPSchrammInvariancePackage {K : RandomWalkKernelPackage}
    {H : RandomSurfaceHeightPackage K}
    {S : ScalingLimitConvergencePackage K H}
    {L : LiouvillePropertyPackage K H S} where
  conformalInvariance : Prop
  explorationMartingale : Prop
  SLEconnection : Prop

structure KPSchrammInvarianceEvidence {K : RandomWalkKernelPackage}
    {H : RandomSurfaceHeightPackage K}
    {S : ScalingLimitConvergencePackage K H}
    {L : LiouvillePropertyPackage K H S}
    (KP : KPSchrammInvariancePackage K H S L) where
  conformalInvarianceClosed : KP.conformalInvariance
  explorationMartingaleClosed : KP.explorationMartingale
  SLEconnectionClosed : KP.SLEconnection

def KPSchrammInvarianceClosed {K : RandomWalkKernelPackage}
    {H : RandomSurfaceHeightPackage K}
    {S : ScalingLimitConvergencePackage K H}
    {L : LiouvillePropertyPackage K H S}
    (KP : KPSchrammInvariancePackage K H S L) : Prop :=
  KP.conformalInvariance ∧ KP.explorationMartingale ∧ KP.SLEconnection

theorem kp_schramm_invariance_closed_from_evidence {K : RandomWalkKernelPackage}
    {H : RandomSurfaceHeightPackage K}
    {S : ScalingLimitConvergencePackage K H}
    {L : LiouvillePropertyPackage K H S}
    (KP : KPSchrammInvariancePackage K H S L)
    (E : KPSchrammInvarianceEvidence KP) : KPSchrammInvarianceClosed KP := by
  exact And.intro E.conformalInvarianceClosed
    (And.intro E.explorationMartingaleClosed E.SLEconnectionClosed)

end DynamicsRandomWalksRandomSurfacesTheoremCanonicalLaneLean
end HautevilleHouse