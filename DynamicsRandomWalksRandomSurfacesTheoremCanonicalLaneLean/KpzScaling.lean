import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsRandomWalksRandomSurfacesTheoremCanonicalLaneLean

structure KpzScaling (R : RandomWalkModel) (S : RandomSurfaceModel) (K : CouplingKernel R S) (H : HeightFluctuation S) where
  scalingExponent : ℝ
  roughnessExponent : ℝ
  growthExponent : ℝ
  universalityClass : Prop

structure KpzScalingEvidence (R : RandomWalkModel) (S : RandomSurfaceModel) (K : CouplingKernel R S) (H : HeightFluctuation S) (Kpz : KpzScaling R S K H) where
  scalingExponentClosed : Kpz.scalingExponent = 1/3
  roughnessExponentClosed : Kpz.roughnessExponent = 1/2
  growthExponentClosed : Kpz.growthExponent = 1/3
  universalityClassClosed : Kpz.universalityClass

def KpzScalingClosed (R : RandomWalkModel) (S : RandomSurfaceModel) (K : CouplingKernel R S) (H : HeightFluctuation S) (Kpz : KpzScaling R S K H) : Prop :=
  Kpz.scalingExponent = 1/3 ∧ Kpz.roughnessExponent = 1/2 ∧ Kpz.growthExponent = 1/3 ∧ Kpz.universalityClass

theorem kpz_scaling_closed_from_evidence (R : RandomWalkModel) (S : RandomSurfaceModel) (K : CouplingKernel R S) (H : HeightFluctuation S) (Kpz : KpzScaling R S K H) (E : KpzScalingEvidence R S K H Kpz) : KpzScalingClosed R S K H Kpz := by
  exact And.intro E.scalingExponentClosed (And.intro E.roughnessExponentClosed (And.intro E.growthExponentClosed E.universalityClassClosed))

end DynamicsRandomWalksRandomSurfacesTheoremCanonicalLaneLean
end HautevilleHouse