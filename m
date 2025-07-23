Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45832CBAABF
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:42:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5261610EA6B;
	Sat, 13 Dec 2025 12:41:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="BKX9qAAC";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C42010E863
 for <nouveau@lists.freedesktop.org>; Wed, 23 Jul 2025 22:12:23 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56NH7iA5016061
 for <nouveau@lists.freedesktop.org>; Wed, 23 Jul 2025 22:12:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=Es8yYGkoaL9WsWMGWRUXzp1VH7ftdQ84HcS
 owvwXJBw=; b=BKX9qAACOypq9Ag3a8Xu0cg0OGsi6d8peARGUYNgHeyAeVeMLC6
 /d5xKbC77jzx63L3x8nsw1HKEHHaiMNzoptPWhtADvfZ2+VS9FNxn3e969zHmbrx
 ZwwpDowpS/xwL1f+JeqfdOX3wphq+JUArvuO5wMHQGR59Wb1FTf27Y2F55dxi9PW
 E5TqDpnUrfo+rEwAVKUbMwmHFzqxOY8yDh6ZVQj6Qv9yyjPxHbZu52Jj49o3w9PE
 0OmYQxXFjwj20Gjpo5/3v/CyLdzceHWam08SQwgiv98y/jpvKh/pOmr2ssoL55ol
 n6Rd5jrXEgHQv6Mgdz9VAhQHCn7hZHYJVFg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48048vd158-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <nouveau@lists.freedesktop.org>; Wed, 23 Jul 2025 22:12:22 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id
 41be03b00d2f7-b2c37558eccso220093a12.1
 for <nouveau@lists.freedesktop.org>; Wed, 23 Jul 2025 15:12:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753308742; x=1753913542;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Es8yYGkoaL9WsWMGWRUXzp1VH7ftdQ84HcSowvwXJBw=;
 b=RDbw6ODPiGqUo+G52SwJH9NMhyq086EgiT4zUj69rlLuLck0lSeRQf+QazMZklzfKC
 LCJkfTDyf1xNciqIwtY1OntR0AQTZxZPIwL8hVnPQ7+K5+zbV2MV7+8VQp+pLPXSMRCr
 3icqAW+PQRgWZ4+S8HKXQhJIk9M6fuGxkSmsHwfZy/c46ET8jKZBTZvYXwGQOo14ObZk
 dsyO0bk5KpRbfafezuoG+QKC3lQTS8MB8J+eLqfkoN8Yuc3fB6tWYdtN2GHDVCsO0jnx
 LgPIKpMa/poZ/xI7jS47Ehgnp0W1GRqjWdi0rTlvNUaxkP1tZHMk4i7xqw6k0S1be8ej
 PHCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqlHOtnRkBFZkcUjhv84eun82cL60FJH1CwEIs2r6Yjq2VPvjDhscvpR95wX9VNRMycPctaprE@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxBjk+xmI7O6AMY6B+T3tKmwNRgkexuZND/tOfIgd8lQS2KG7Ll
 cYl63FFHGt09Y+zqMb/Po3k2LS1PS2Kf48DckSwGBjlKxYIjwN+Z6fqt/VOrNlODICg4vHK/0t+
 O5MLKKyBN8joKBPBXLG8T7WE4Yn3OV7gEDypK6qj7BhEh6sjVnAs/sngZd1/WdiKMz5An
X-Gm-Gg: ASbGncuwWaUg1KVgnu3OQz5L6Qq9sRUmONahkLLhFabsOob94Hnvj1jgqVCO2poVXQp
 I62uRAlQbglVYy3XDsSkSiPX+/IeSHHmfgzMGa8LQewiF36KotkuQC9o9G68tFqBnk1TkTLFXQy
 q0k1W96GOgsqALqYRoOElpUTOdhrpTAiyTzo3b+dBznFeqIR8AKwSCoayvhnCR+nweMS662luLU
 fAvmylf+RWQTaOrcOUKFXwgqsGuZl+C1w78pVi44nxgrWHhsCdZXiLPMEC27WGlIivWd1Kj0K3Y
 pc7YUW9wppaCTg2Eg9n+zXi075QE/xcuyViUFsTh48C8b84rnsk=
X-Received: by 2002:a17:90b:3d4c:b0:313:f6fa:5bca with SMTP id
 98e67ed59e1d1-31e507c451bmr5990917a91.22.1753308742102; 
 Wed, 23 Jul 2025 15:12:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHzd56I31a4tiJMX9/aFKEr6IuO0MhOWD335Z5swX27LPpZumR9v/x7YlbWBlBa4lwLXzCKwQ==
X-Received: by 2002:a17:90b:3d4c:b0:313:f6fa:5bca with SMTP id
 98e67ed59e1d1-31e507c451bmr5990882a91.22.1753308741676; 
 Wed, 23 Jul 2025 15:12:21 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31e639f6c1esm72938a91.14.2025.07.23.15.12.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jul 2025 15:12:21 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Danilo Krummrich <dakr@redhat.com>, Connor Abbott <cwabbott0@gmail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 linux-kernel@vger.kernel.org (open list), Lyude Paul <lyude@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maxime Ripard <mripard@kernel.org>,
 nouveau@lists.freedesktop.org (open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO
 GPUS), Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 0/2] drm/gpuvm+msm: Handle in-place remaps
Date: Wed, 23 Jul 2025 15:12:10 -0700
Message-ID: <20250723221213.36325-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 1fTKqDSVaCVUyXUOIpryaTYnbtJFmF_E
X-Authority-Analysis: v=2.4 cv=SYL3duRu c=1 sm=1 tr=0 ts=68815e47 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=r9eiMqSCUvIwoLEqkV8A:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDE5MCBTYWx0ZWRfX3GzFFDo76/sy
 y/n2yS1tjOD2Ze79oMtNJCBrbwUHHJLSpnTY+KSGkEOjMn9tXgyEmcCs7SZrbjzXoPu4zN87QJV
 ePKrFdwS/czbodXCOvh1b7rHI8Rg9bmuISG1ADAQmiL5B9dWrHBGq53r6cz+iOmZzVZaMzY+CpE
 MP5irQPYp7eilSVlGNROIuvhwPEG+jph7vNWFEmjR3D+vKe78KYLyGWrzpyQfIIruegnK+Ci9Eo
 OI1TNVtcVHN9h4rZKa0Foh75IOxCqPxnCvl4NxRWWk6zuKGGtkDmxYCVrylpDtJsKAUM+EAD7Vw
 UBsgDg2CvnBRrnLgPucfrK3b+meUts3b/XKujOqpl6vYpgIWHvbS7W3rjwlww+OSCEeMaAYAHYo
 5jTwJMcMnLNMPb+svgd5MJRYyzeV64s6u98oZEujOx6sBwcojOmGK2wC2I4rMuhd1F3mEOeM
X-Proofpoint-ORIG-GUID: 1fTKqDSVaCVUyXUOIpryaTYnbtJFmF_E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_03,2025-07-23_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 mlxscore=0 bulkscore=0 mlxlogscore=731
 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0 clxscore=1011
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507230190
X-Mailman-Approved-At: Sat, 13 Dec 2025 12:40:42 +0000
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

turnip+msm uses a DUMP flag on the gpuva to indicate VA ranges to dump
(ie. for devcoredump).  In most cases (internal BOs like shader
instructions) this is known at the time the BO is MAPd, and the DUMP
flag can be set at the same time as the BO is initially bound into the
VM.  But for descriptor buffers, this isn't known until VkBuffer is
bound to the already mapped VkDeviceMemory, requiring an atomic remap
to set the flag.

The problem is that drmvm turns this into discreet unmap and remap
steps.  So there is a window where the VA is not mapped, which can
race with cmdstream exec (SUBMIT).

This series attempts to avoid that by turning an exact-remap into a
remap op instead, where the driver can handle the special case since
it can see both the unmap and map steps at the same time.

Rob Clark (2):
  drm/gpuvm: Send in-place re-maps to the driver as remap
  drm/msm: Handle in-place remaps

 drivers/gpu/drm/drm_gpuvm.c            | 21 +++++++++++++++++++++
 drivers/gpu/drm/msm/msm_gem_vma.c      | 17 +++++++++++++++--
 drivers/gpu/drm/nouveau/nouveau_uvmm.c |  3 ++-
 3 files changed, 38 insertions(+), 3 deletions(-)

-- 
2.50.1

