import DynamicsRandomWalksRandomSurfacesTheoremCanonicalLaneLean.RandomSurfacePackage

namespace HautevilleHouse
namespace DynamicsRandomWalksRandomSurfacesTheoremCanonicalLaneLean

structure ScalingLimitPackage {R : RandomWalkPackage} {S : RandomSurfacePackage R} where
  scalingExponent : ℝ
  limitProcess : Type u
  weakConvergence : Prop
  universalityClass : Prop
  scalingExponentPositive : Prop
  weakConvergenceTerm : weakConvergence
  universalityClassTerm : universalityClass
  scalingExponentPositiveTerm : scalingExponentPositive

def ScalingLimitClosed {R : RandomWalkPackage} {S : RandomSurfacePackage R}
    (L : ScalingLimitPackage R S) : Prop :=
  L.weakConvergence ∧ L.universalityClass ∧ L.scalingExponentPositive

theorem scaling_limit_closed_from_evidence {R : RandomWalkPackage}
    {S : RandomSurfacePackage R} (L : ScalingLimitPackage R S)
    (E : ScalingLimitEvidence L) : ScalingLimitClosed L := by
  exact And.intro E.weakConvergenceTerm
    (And.intro E.universalityClassTerm E.scalingExponentPositiveTerm)

structure ScalingLimitEvidence {R : RandomWalkPackage} {S : RandomSurfacePackage R}
    (L : ScalingLimitPackage R S) where
  weakConvergenceTerm : L.weakConvergence
  universalityClassTerm : L.universalityClass
  scalingExponentPositiveTerm : L.scalingExponentPositive

end DynamicsRandomWalksRandomSurfacesTheoremCanonicalLaneLean
end HautevilleHouse
