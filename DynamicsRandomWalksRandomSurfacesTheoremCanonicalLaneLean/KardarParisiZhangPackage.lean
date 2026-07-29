import DynamicsRandomWalksRandomSurfacesTheoremCanonicalLaneLean.ScalingLimitPackage

namespace HautevilleHouse
namespace DynamicsRandomWalksRandomSurfacesTheoremCanonicalLaneLean

structure KardarParisiZhangPackage {R : RandomWalkPackage} {S : RandomSurfacePackage R}
    {L : ScalingLimitPackage R S} where
  kpzEquation : Prop
  nonLinearTerm : Prop
  stationarySolution : Prop
  heightCorrelationScaling : Prop
  kpzEquationTerm : kpzEquation
  nonLinearTermTerm : nonLinearTerm
  stationarySolutionTerm : stationarySolution
  heightCorrelationScalingTerm : heightCorrelationScaling

def KardarParisiZhangClosed {R : RandomWalkPackage} {S : RandomSurfacePackage R}
    {L : ScalingLimitPackage R S} (K : KardarParisiZhangPackage R S L) : Prop :=
  K.kpzEquation ∧ K.nonLinearTerm ∧ K.stationarySolution ∧ K.heightCorrelationScaling

theorem kpz_closed_from_evidence {R : RandomWalkPackage} {S : RandomSurfacePackage R}
    {L : ScalingLimitPackage R S} (K : KardarParisiZhangPackage R S L)
    (E : KardarParisiZhangEvidence K) : KardarParisiZhangClosed K := by
  exact And.intro E.kpzEquationTerm
    (And.intro E.nonLinearTermTerm
      (And.intro E.stationarySolutionTerm E.heightCorrelationScalingTerm))

structure KardarParisiZhangEvidence {R : RandomWalkPackage} {S : RandomSurfacePackage R}
    {L : ScalingLimitPackage R S} (K : KardarParisiZhangPackage R S L) where
  kpzEquationTerm : K.kpzEquation
  nonLinearTermTerm : K.nonLinearTerm
  stationarySolutionTerm : K.stationarySolution
  heightCorrelationScalingTerm : K.heightCorrelationScaling

end DynamicsRandomWalksRandomSurfacesTheoremCanonicalLaneLean
end HautevilleHouse
