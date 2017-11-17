package com.wisezone.entity;

import java.util.ArrayList;
import java.util.List;

public class QuestionsExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    private Integer limit;

    private Integer offset;

    public QuestionsExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    public void setLimit(Integer limit) {
        this.limit = limit;
    }

    public Integer getLimit() {
        return limit;
    }

    public void setOffset(Integer offset) {
        this.offset = offset;
    }

    public Integer getOffset() {
        return offset;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andIdIsNull() {
            addCriterion("q.id is null");
            return (Criteria) this;
        }

        public Criteria andIdIsNotNull() {
            addCriterion("q.id is not null");
            return (Criteria) this;
        }

        public Criteria andIdEqualTo(Integer value) {
            addCriterion("q.id =", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotEqualTo(Integer value) {
            addCriterion("q.id <>", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThan(Integer value) {
            addCriterion("q.id >", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("q.id >=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThan(Integer value) {
            addCriterion("q.id <", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThanOrEqualTo(Integer value) {
            addCriterion("q.id <=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdIn(List<Integer> values) {
            addCriterion("q.id in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotIn(List<Integer> values) {
            addCriterion("q.id not in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdBetween(Integer value1, Integer value2) {
            addCriterion("q.id between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotBetween(Integer value1, Integer value2) {
            addCriterion("q.id not between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andQuestionNameIsNull() {
            addCriterion("questionName is null");
            return (Criteria) this;
        }

        public Criteria andQuestionNameIsNotNull() {
            addCriterion("questionName is not null");
            return (Criteria) this;
        }

        public Criteria andQuestionNameEqualTo(String value) {
            addCriterion("questionName =", value, "questionName");
            return (Criteria) this;
        }

        public Criteria andQuestionNameNotEqualTo(String value) {
            addCriterion("questionName <>", value, "questionName");
            return (Criteria) this;
        }

        public Criteria andQuestionNameGreaterThan(String value) {
            addCriterion("questionName >", value, "questionName");
            return (Criteria) this;
        }

        public Criteria andQuestionNameGreaterThanOrEqualTo(String value) {
            addCriterion("questionName >=", value, "questionName");
            return (Criteria) this;
        }

        public Criteria andQuestionNameLessThan(String value) {
            addCriterion("questionName <", value, "questionName");
            return (Criteria) this;
        }

        public Criteria andQuestionNameLessThanOrEqualTo(String value) {
            addCriterion("questionName <=", value, "questionName");
            return (Criteria) this;
        }

        public Criteria andQuestionNameLike(String value) {
            addCriterion("questionName like", value, "questionName");
            return (Criteria) this;
        }

        public Criteria andQuestionNameNotLike(String value) {
            addCriterion("questionName not like", value, "questionName");
            return (Criteria) this;
        }

        public Criteria andQuestionNameIn(List<String> values) {
            addCriterion("questionName in", values, "questionName");
            return (Criteria) this;
        }

        public Criteria andQuestionNameNotIn(List<String> values) {
            addCriterion("questionName not in", values, "questionName");
            return (Criteria) this;
        }

        public Criteria andQuestionNameBetween(String value1, String value2) {
            addCriterion("questionName between", value1, value2, "questionName");
            return (Criteria) this;
        }

        public Criteria andQuestionNameNotBetween(String value1, String value2) {
            addCriterion("questionName not between", value1, value2, "questionName");
            return (Criteria) this;
        }

        public Criteria andParentTypeIdIsNull() {
            addCriterion("parentTypeId is null");
            return (Criteria) this;
        }

        public Criteria andParentTypeIdIsNotNull() {
            addCriterion("parentTypeId is not null");
            return (Criteria) this;
        }

        public Criteria andParentTypeIdEqualTo(Integer value) {
            addCriterion("parentTypeId =", value, "parentTypeId");
            return (Criteria) this;
        }

        public Criteria andParentTypeIdNotEqualTo(Integer value) {
            addCriterion("parentTypeId <>", value, "parentTypeId");
            return (Criteria) this;
        }

        public Criteria andParentTypeIdGreaterThan(Integer value) {
            addCriterion("parentTypeId >", value, "parentTypeId");
            return (Criteria) this;
        }

        public Criteria andParentTypeIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("parentTypeId >=", value, "parentTypeId");
            return (Criteria) this;
        }

        public Criteria andParentTypeIdLessThan(Integer value) {
            addCriterion("parentTypeId <", value, "parentTypeId");
            return (Criteria) this;
        }

        public Criteria andParentTypeIdLessThanOrEqualTo(Integer value) {
            addCriterion("parentTypeId <=", value, "parentTypeId");
            return (Criteria) this;
        }

        public Criteria andParentTypeIdIn(List<Integer> values) {
            addCriterion("parentTypeId in", values, "parentTypeId");
            return (Criteria) this;
        }

        public Criteria andParentTypeIdNotIn(List<Integer> values) {
            addCriterion("parentTypeId not in", values, "parentTypeId");
            return (Criteria) this;
        }

        public Criteria andParentTypeIdBetween(Integer value1, Integer value2) {
            addCriterion("parentTypeId between", value1, value2, "parentTypeId");
            return (Criteria) this;
        }

        public Criteria andParentTypeIdNotBetween(Integer value1, Integer value2) {
            addCriterion("parentTypeId not between", value1, value2, "parentTypeId");
            return (Criteria) this;
        }

        public Criteria andChildTypeIdIsNull() {
            addCriterion("childTypeId is null");
            return (Criteria) this;
        }

        public Criteria andChildTypeIdIsNotNull() {
            addCriterion("childTypeId is not null");
            return (Criteria) this;
        }

        public Criteria andChildTypeIdEqualTo(Integer value) {
            addCriterion("childTypeId =", value, "childTypeId");
            return (Criteria) this;
        }

        public Criteria andChildTypeIdNotEqualTo(Integer value) {
            addCriterion("childTypeId <>", value, "childTypeId");
            return (Criteria) this;
        }

        public Criteria andChildTypeIdGreaterThan(Integer value) {
            addCriterion("childTypeId >", value, "childTypeId");
            return (Criteria) this;
        }

        public Criteria andChildTypeIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("childTypeId >=", value, "childTypeId");
            return (Criteria) this;
        }

        public Criteria andChildTypeIdLessThan(Integer value) {
            addCriterion("childTypeId <", value, "childTypeId");
            return (Criteria) this;
        }

        public Criteria andChildTypeIdLessThanOrEqualTo(Integer value) {
            addCriterion("childTypeId <=", value, "childTypeId");
            return (Criteria) this;
        }

        public Criteria andChildTypeIdIn(List<Integer> values) {
            addCriterion("childTypeId in", values, "childTypeId");
            return (Criteria) this;
        }

        public Criteria andChildTypeIdNotIn(List<Integer> values) {
            addCriterion("childTypeId not in", values, "childTypeId");
            return (Criteria) this;
        }

        public Criteria andChildTypeIdBetween(Integer value1, Integer value2) {
            addCriterion("childTypeId between", value1, value2, "childTypeId");
            return (Criteria) this;
        }

        public Criteria andChildTypeIdNotBetween(Integer value1, Integer value2) {
            addCriterion("childTypeId not between", value1, value2, "childTypeId");
            return (Criteria) this;
        }

        public Criteria andDifficultIsNull() {
            addCriterion("difficult is null");
            return (Criteria) this;
        }

        public Criteria andDifficultIsNotNull() {
            addCriterion("difficult is not null");
            return (Criteria) this;
        }

        public Criteria andDifficultEqualTo(Integer value) {
            addCriterion("difficult =", value, "difficult");
            return (Criteria) this;
        }

        public Criteria andDifficultNotEqualTo(Integer value) {
            addCriterion("difficult <>", value, "difficult");
            return (Criteria) this;
        }

        public Criteria andDifficultGreaterThan(Integer value) {
            addCriterion("difficult >", value, "difficult");
            return (Criteria) this;
        }

        public Criteria andDifficultGreaterThanOrEqualTo(Integer value) {
            addCriterion("difficult >=", value, "difficult");
            return (Criteria) this;
        }

        public Criteria andDifficultLessThan(Integer value) {
            addCriterion("difficult <", value, "difficult");
            return (Criteria) this;
        }

        public Criteria andDifficultLessThanOrEqualTo(Integer value) {
            addCriterion("difficult <=", value, "difficult");
            return (Criteria) this;
        }

        public Criteria andDifficultIn(List<Integer> values) {
            addCriterion("difficult in", values, "difficult");
            return (Criteria) this;
        }

        public Criteria andDifficultNotIn(List<Integer> values) {
            addCriterion("difficult not in", values, "difficult");
            return (Criteria) this;
        }

        public Criteria andDifficultBetween(Integer value1, Integer value2) {
            addCriterion("difficult between", value1, value2, "difficult");
            return (Criteria) this;
        }

        public Criteria andDifficultNotBetween(Integer value1, Integer value2) {
            addCriterion("difficult not between", value1, value2, "difficult");
            return (Criteria) this;
        }

        public Criteria andAnswerIsNull() {
            addCriterion("answer is null");
            return (Criteria) this;
        }

        public Criteria andAnswerIsNotNull() {
            addCriterion("answer is not null");
            return (Criteria) this;
        }

        public Criteria andAnswerEqualTo(String value) {
            addCriterion("answer =", value, "answer");
            return (Criteria) this;
        }

        public Criteria andAnswerNotEqualTo(String value) {
            addCriterion("answer <>", value, "answer");
            return (Criteria) this;
        }

        public Criteria andAnswerGreaterThan(String value) {
            addCriterion("answer >", value, "answer");
            return (Criteria) this;
        }

        public Criteria andAnswerGreaterThanOrEqualTo(String value) {
            addCriterion("answer >=", value, "answer");
            return (Criteria) this;
        }

        public Criteria andAnswerLessThan(String value) {
            addCriterion("answer <", value, "answer");
            return (Criteria) this;
        }

        public Criteria andAnswerLessThanOrEqualTo(String value) {
            addCriterion("answer <=", value, "answer");
            return (Criteria) this;
        }

        public Criteria andAnswerLike(String value) {
            addCriterion("answer like", value, "answer");
            return (Criteria) this;
        }

        public Criteria andAnswerNotLike(String value) {
            addCriterion("answer not like", value, "answer");
            return (Criteria) this;
        }

        public Criteria andAnswerIn(List<String> values) {
            addCriterion("answer in", values, "answer");
            return (Criteria) this;
        }

        public Criteria andAnswerNotIn(List<String> values) {
            addCriterion("answer not in", values, "answer");
            return (Criteria) this;
        }

        public Criteria andAnswerBetween(String value1, String value2) {
            addCriterion("answer between", value1, value2, "answer");
            return (Criteria) this;
        }

        public Criteria andAnswerNotBetween(String value1, String value2) {
            addCriterion("answer not between", value1, value2, "answer");
            return (Criteria) this;
        }

        public Criteria andQuestionTypeIsNull() {
            addCriterion("questionType is null");
            return (Criteria) this;
        }

        public Criteria andQuestionTypeIsNotNull() {
            addCriterion("questionType is not null");
            return (Criteria) this;
        }

        public Criteria andQuestionTypeEqualTo(Integer value) {
            addCriterion("questionType =", value, "questionType");
            return (Criteria) this;
        }

        public Criteria andQuestionTypeNotEqualTo(Integer value) {
            addCriterion("questionType <>", value, "questionType");
            return (Criteria) this;
        }

        public Criteria andQuestionTypeGreaterThan(Integer value) {
            addCriterion("questionType >", value, "questionType");
            return (Criteria) this;
        }

        public Criteria andQuestionTypeGreaterThanOrEqualTo(Integer value) {
            addCriterion("questionType >=", value, "questionType");
            return (Criteria) this;
        }

        public Criteria andQuestionTypeLessThan(Integer value) {
            addCriterion("questionType <", value, "questionType");
            return (Criteria) this;
        }

        public Criteria andQuestionTypeLessThanOrEqualTo(Integer value) {
            addCriterion("questionType <=", value, "questionType");
            return (Criteria) this;
        }

        public Criteria andQuestionTypeIn(List<Integer> values) {
            addCriterion("questionType in", values, "questionType");
            return (Criteria) this;
        }

        public Criteria andQuestionTypeNotIn(List<Integer> values) {
            addCriterion("questionType not in", values, "questionType");
            return (Criteria) this;
        }

        public Criteria andQuestionTypeBetween(Integer value1, Integer value2) {
            addCriterion("questionType between", value1, value2, "questionType");
            return (Criteria) this;
        }

        public Criteria andQuestionTypeNotBetween(Integer value1, Integer value2) {
            addCriterion("questionType not between", value1, value2, "questionType");
            return (Criteria) this;
        }

        public Criteria andChoiseaIsNull() {
            addCriterion("choisea is null");
            return (Criteria) this;
        }

        public Criteria andChoiseaIsNotNull() {
            addCriterion("choisea is not null");
            return (Criteria) this;
        }

        public Criteria andChoiseaEqualTo(String value) {
            addCriterion("choisea =", value, "choisea");
            return (Criteria) this;
        }

        public Criteria andChoiseaNotEqualTo(String value) {
            addCriterion("choisea <>", value, "choisea");
            return (Criteria) this;
        }

        public Criteria andChoiseaGreaterThan(String value) {
            addCriterion("choisea >", value, "choisea");
            return (Criteria) this;
        }

        public Criteria andChoiseaGreaterThanOrEqualTo(String value) {
            addCriterion("choisea >=", value, "choisea");
            return (Criteria) this;
        }

        public Criteria andChoiseaLessThan(String value) {
            addCriterion("choisea <", value, "choisea");
            return (Criteria) this;
        }

        public Criteria andChoiseaLessThanOrEqualTo(String value) {
            addCriterion("choisea <=", value, "choisea");
            return (Criteria) this;
        }

        public Criteria andChoiseaLike(String value) {
            addCriterion("choisea like", value, "choisea");
            return (Criteria) this;
        }

        public Criteria andChoiseaNotLike(String value) {
            addCriterion("choisea not like", value, "choisea");
            return (Criteria) this;
        }

        public Criteria andChoiseaIn(List<String> values) {
            addCriterion("choisea in", values, "choisea");
            return (Criteria) this;
        }

        public Criteria andChoiseaNotIn(List<String> values) {
            addCriterion("choisea not in", values, "choisea");
            return (Criteria) this;
        }

        public Criteria andChoiseaBetween(String value1, String value2) {
            addCriterion("choisea between", value1, value2, "choisea");
            return (Criteria) this;
        }

        public Criteria andChoiseaNotBetween(String value1, String value2) {
            addCriterion("choisea not between", value1, value2, "choisea");
            return (Criteria) this;
        }

        public Criteria andChoisebIsNull() {
            addCriterion("choiseb is null");
            return (Criteria) this;
        }

        public Criteria andChoisebIsNotNull() {
            addCriterion("choiseb is not null");
            return (Criteria) this;
        }

        public Criteria andChoisebEqualTo(String value) {
            addCriterion("choiseb =", value, "choiseb");
            return (Criteria) this;
        }

        public Criteria andChoisebNotEqualTo(String value) {
            addCriterion("choiseb <>", value, "choiseb");
            return (Criteria) this;
        }

        public Criteria andChoisebGreaterThan(String value) {
            addCriterion("choiseb >", value, "choiseb");
            return (Criteria) this;
        }

        public Criteria andChoisebGreaterThanOrEqualTo(String value) {
            addCriterion("choiseb >=", value, "choiseb");
            return (Criteria) this;
        }

        public Criteria andChoisebLessThan(String value) {
            addCriterion("choiseb <", value, "choiseb");
            return (Criteria) this;
        }

        public Criteria andChoisebLessThanOrEqualTo(String value) {
            addCriterion("choiseb <=", value, "choiseb");
            return (Criteria) this;
        }

        public Criteria andChoisebLike(String value) {
            addCriterion("choiseb like", value, "choiseb");
            return (Criteria) this;
        }

        public Criteria andChoisebNotLike(String value) {
            addCriterion("choiseb not like", value, "choiseb");
            return (Criteria) this;
        }

        public Criteria andChoisebIn(List<String> values) {
            addCriterion("choiseb in", values, "choiseb");
            return (Criteria) this;
        }

        public Criteria andChoisebNotIn(List<String> values) {
            addCriterion("choiseb not in", values, "choiseb");
            return (Criteria) this;
        }

        public Criteria andChoisebBetween(String value1, String value2) {
            addCriterion("choiseb between", value1, value2, "choiseb");
            return (Criteria) this;
        }

        public Criteria andChoisebNotBetween(String value1, String value2) {
            addCriterion("choiseb not between", value1, value2, "choiseb");
            return (Criteria) this;
        }

        public Criteria andChoisecIsNull() {
            addCriterion("choisec is null");
            return (Criteria) this;
        }

        public Criteria andChoisecIsNotNull() {
            addCriterion("choisec is not null");
            return (Criteria) this;
        }

        public Criteria andChoisecEqualTo(String value) {
            addCriterion("choisec =", value, "choisec");
            return (Criteria) this;
        }

        public Criteria andChoisecNotEqualTo(String value) {
            addCriterion("choisec <>", value, "choisec");
            return (Criteria) this;
        }

        public Criteria andChoisecGreaterThan(String value) {
            addCriterion("choisec >", value, "choisec");
            return (Criteria) this;
        }

        public Criteria andChoisecGreaterThanOrEqualTo(String value) {
            addCriterion("choisec >=", value, "choisec");
            return (Criteria) this;
        }

        public Criteria andChoisecLessThan(String value) {
            addCriterion("choisec <", value, "choisec");
            return (Criteria) this;
        }

        public Criteria andChoisecLessThanOrEqualTo(String value) {
            addCriterion("choisec <=", value, "choisec");
            return (Criteria) this;
        }

        public Criteria andChoisecLike(String value) {
            addCriterion("choisec like", value, "choisec");
            return (Criteria) this;
        }

        public Criteria andChoisecNotLike(String value) {
            addCriterion("choisec not like", value, "choisec");
            return (Criteria) this;
        }

        public Criteria andChoisecIn(List<String> values) {
            addCriterion("choisec in", values, "choisec");
            return (Criteria) this;
        }

        public Criteria andChoisecNotIn(List<String> values) {
            addCriterion("choisec not in", values, "choisec");
            return (Criteria) this;
        }

        public Criteria andChoisecBetween(String value1, String value2) {
            addCriterion("choisec between", value1, value2, "choisec");
            return (Criteria) this;
        }

        public Criteria andChoisecNotBetween(String value1, String value2) {
            addCriterion("choisec not between", value1, value2, "choisec");
            return (Criteria) this;
        }

        public Criteria andChoisedIsNull() {
            addCriterion("choised is null");
            return (Criteria) this;
        }

        public Criteria andChoisedIsNotNull() {
            addCriterion("choised is not null");
            return (Criteria) this;
        }

        public Criteria andChoisedEqualTo(String value) {
            addCriterion("choised =", value, "choised");
            return (Criteria) this;
        }

        public Criteria andChoisedNotEqualTo(String value) {
            addCriterion("choised <>", value, "choised");
            return (Criteria) this;
        }

        public Criteria andChoisedGreaterThan(String value) {
            addCriterion("choised >", value, "choised");
            return (Criteria) this;
        }

        public Criteria andChoisedGreaterThanOrEqualTo(String value) {
            addCriterion("choised >=", value, "choised");
            return (Criteria) this;
        }

        public Criteria andChoisedLessThan(String value) {
            addCriterion("choised <", value, "choised");
            return (Criteria) this;
        }

        public Criteria andChoisedLessThanOrEqualTo(String value) {
            addCriterion("choised <=", value, "choised");
            return (Criteria) this;
        }

        public Criteria andChoisedLike(String value) {
            addCriterion("choised like", value, "choised");
            return (Criteria) this;
        }

        public Criteria andChoisedNotLike(String value) {
            addCriterion("choised not like", value, "choised");
            return (Criteria) this;
        }

        public Criteria andChoisedIn(List<String> values) {
            addCriterion("choised in", values, "choised");
            return (Criteria) this;
        }

        public Criteria andChoisedNotIn(List<String> values) {
            addCriterion("choised not in", values, "choised");
            return (Criteria) this;
        }

        public Criteria andChoisedBetween(String value1, String value2) {
            addCriterion("choised between", value1, value2, "choised");
            return (Criteria) this;
        }

        public Criteria andChoisedNotBetween(String value1, String value2) {
            addCriterion("choised not between", value1, value2, "choised");
            return (Criteria) this;
        }
    }

    /**
     */
    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}