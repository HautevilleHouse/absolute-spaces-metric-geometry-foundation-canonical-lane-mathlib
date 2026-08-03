import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace AbsoluteSpacesMetricGeometryFoundationCanonicalLaneLean

/-- A synthetic absolute space with betweenness and equidistance primitives. -/
structure AbsoluteSpace where
  Point : Type
  Between : Point → Point → Point → Prop
  Equidistant : Point → Point → Point → Point → Prop

/-- Betweenness identity: a point between its endpoint and itself forces equality. -/
def BetweenIdentity (A : AbsoluteSpace) : Prop :=
  ∀ {a b : A.Point}, A.Between a b a → a = b

/-- Equidistance symmetry: equidistance is symmetric in its endpoints. -/
def EquidistanceSymmetry (A : AbsoluteSpace) : Prop :=
  ∀ {a b c d : A.Point}, A.Equidistant a b c d → A.Equidistant c d a b

/-- Segment extension: every segment can be extended beyond its endpoint. -/
def SegmentExtension (A : AbsoluteSpace) : Prop :=
  ∀ (a b : A.Point), ∃ c : A.Point, A.Between a b c ∧ A.Equidistant b c a b

/-- Pasch's axiom: the plane-crossing property for betweenness. -/
def PaschAxiom (A : AbsoluteSpace) : Prop :=
  ∀ {a b c p q : A.Point}, A.Between a p c → A.Between b q c →
    ∃ x : A.Point, A.Between p x b ∧ A.Between q x a

/-- The metric foundation of an absolute space: the standard absolute-geometry axioms. -/
structure AbsoluteMetricFoundation (A : AbsoluteSpace) : Prop where
  between_identity : BetweenIdentity A
  equidistance_symmetry : EquidistanceSymmetry A
  segment_extension : SegmentExtension A
  pasch_axiom : PaschAxiom A

/-- The absolute metric closure condition: the space admits a metric foundation. -/
def AbsoluteMetricClosure (A : AbsoluteSpace) : Prop :=
  AbsoluteMetricFoundation A

/-- An admissible class over absolute spaces, with endpoint and remainder evidence. -/
structure AdmissibleClass where
  object : AbsoluteSpace
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

/-- Bridge closed: the underlying object satisfies the absolute metric closure. -/
def bridgeClosed (A : AdmissibleClass) : Prop :=
  AbsoluteMetricClosure A.object

/-- Gate closed: either the endpoint or the remainder witness is available. -/
def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

/-- The admissible closure of an absolute-space metric-geometry foundation. -/
def admittedClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

/-- The bridge side is always constructible from a metric foundation. -/
theorem bridge_from_admissible_class (A : AdmissibleClass) :
    AbsoluteMetricClosure A.object → bridgeClosed A := by
  intro h
  exact h

/-- The gate side is always constructible from the admissible-class witness. -/
theorem gate_from_admissible_class (A : AdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

/-- Endgame: every absolute space with a metric foundation is admitted. -/
theorem absolute_spaces_metric_foundation_endgame (A : AdmissibleClass) :
    AbsoluteMetricClosure A.object → admittedClosure A := by
  intro h
  exact And.intro (bridge_from_admissible_class A h) (gate_from_admissible_class A)

end AbsoluteSpacesMetricGeometryFoundationCanonicalLaneLean
end HautevilleHouse