---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: {{ include "common.fullname" . }}
  namespace: {{ .Release.Namespace }}
  labels:
    {{- include "common.apiLabels" . | nindent 4 }}
spec:
  selector:
    matchLabels:
      {{- include "common.apiSelectorLabels" . | nindent 6 }}
  template:
    metadata:
      labels:
        {{- include "common.apiSelectorLabels" . | nindent 8 }}
    spec:
      serviceAccountName: {{ .Values.serviceAccount.name }}
      automountServiceAccountToken: true
      containers:
        - name: {{ include "common.fullname" . }}
          image: "{{ .Values.image.repository }}:{{ .Values.image.tag }}"
          ports:
            - name: api
              containerPort: 8080
              hostPort: 8080
          readinessProbe: null
          livenessProbe: null
          resources:
            limits:
              cpu: 100m
              memory: 256Mi
            requests:
              cpu: 100m
              memory: 256Mi
          envFrom:
            - configMapRef:
                name: {{ include "common.fullname" . }}
