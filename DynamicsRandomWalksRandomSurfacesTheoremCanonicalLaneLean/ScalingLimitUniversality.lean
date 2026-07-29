import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsRandomWalksRandomSurfacesTheoremCanonicalLaneLean

structure ScalingLimitUniversalityPackage where
  interfaceScaling : Type u → Type v
  kpzFixedPoint : Type w
  tasepConvergence : Prop
  langevinFluctuation : Prop
  universalityClass : Prop

structure ScalingLimitUniversalityEvidence (S : ScalingLimitUniversalityPackage) where
  tasepConvergenceClosed : S.tasepConvergence
  langevinFluctuationClosed : S.langevinFluctuation
  universalityClassClosed : S.universalityClass

def ScalingLimitUniversalityClosed (S : ScalingLimitUniversalityPackage) : Prop :=
  S.tasepConvergence ∧ S.langevinFluctuation ∧ S.universalityClass

theorem scaling_limit_universality_closed_from_evidence
    (S : ScalingLimitUniversalityPackage)
    (E : ScalingLimitUniversalityEvidence S) : ScalingLimitUniversalityClosed S := by
  exact And.intro E.tasepConvergenceClosed
    (And.intro E.langevinFluctuationClosed E.universalityClassClosed)

end DynamicsRandomWalksRandomSurfacesTheoremCanonicalLaneLean
end HautevilleHouse
