import canonicalLaneMathlib.AdmissibleClass
import DynamicsRandomWalksRandomSurfacesTheoremCanonicalLaneLean.RandomSurfaceHeight

namespace HautevilleHouse
namespace DynamicsRandomWalksRandomSurfacesTheoremCanonicalLaneLean

structure ScalingLimitConvergencePackage {K : RandomWalkKernelPackage}
    {H : RandomSurfaceHeightPackage K} where
  roughPathLift : Prop
  scalingParameter : ℝ
  limitObject : Type u
  convergesInProbability : Prop
  tighness : Prop

structure ScalingLimitConvergenceEvidence {K : RandomWalkKernelPackage}
    {H : RandomSurfaceHeightPackage K} (S : ScalingLimitConvergencePackage K H) where
  roughPathLiftClosed : S.roughPathLift
  convergesInProbabilityClosed : S.convergesInProbability
  tighnessClosed : S.tighness

def ScalingLimitConvergenceClosed {K : RandomWalkKernelPackage}
    {H : RandomSurfaceHeightPackage K} (S : ScalingLimitConvergencePackage K H) : Prop :=
  S.roughPathLift ∧ S.convergesInProbability ∧ S.tighness

theorem scaling_limit_convergence_closed_from_evidence {K : RandomWalkKernelPackage}
    {H : RandomSurfaceHeightPackage K} (S : ScalingLimitConvergencePackage K H)
    (E : ScalingLimitConvergenceEvidence S) : ScalingLimitConvergenceClosed S := by
  exact And.intro E.roughPathLiftClosed (And.intro E.convergesInProbabilityClosed E.tighnessClosed)

end DynamicsRandomWalksRandomSurfacesTheoremCanonicalLaneLean
end HautevilleHouse