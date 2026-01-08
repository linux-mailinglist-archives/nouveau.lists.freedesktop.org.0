Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C663D042C7
	for <lists+nouveau@lfdr.de>; Thu, 08 Jan 2026 17:07:54 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 103EB10E79A;
	Thu,  8 Jan 2026 16:07:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="Jk+B4jyO";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 10BCC44C76;
	Thu,  8 Jan 2026 15:59:30 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767887969;
 b=D9o6C/fAZxA+Yj3fWjhpBqvbmCC5trWFbFF12JkDPiF7QPDiNmZCEfUy4Y0IUEM/xg41R
 MLRvC/c8uJKhQ22e2OM6mcfUln5fy6aYDjXil4SO/pOR/dp1J/GqaMwyIrOA598qhf2frct
 qeqBXc9t9Nz8QHWhfcGMLx9O2uudS5dAiKSUYJ321bPh+Yn+Tl8WKCemrCpqIeb+mEPB4td
 epTrJXlbPUPuojE8m2oUz8Zwq0udWvylsiKXl6kFJN6BOixAnKa/O0bi/fSHf6fdB8WR5vR
 7UxnvmWDjjbC2E0FJO6W5EpRA1b9lIQUstTQCcErZtTGQws2OnLv43vqb0Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767887969; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=GgFTUVqrsSYoJNwoFQtQbYpFqJVNoWHrRDOGPnWEKHg=;
 b=opTlrXB4dzHo4sZ7vr1p3BH9cry3nYwbeMaXZ5IJIw0P2Nm+i3EcExJ8CPs4iwG4tqs8e
 yahw1f79nI4RyxXxn2gsI5q54AggSpzwiABmRYhrzbJYeGKEc2v9Q+HUqj4PXqn5WT3jxOo
 TfQtdsVVs5ebeOD27AmmNOX3fBkUswGjk7nUnXNp7hsmxSJIoDlUsiFZfQ3iVt37aEAOWtS
 DgWj9kmjY3PFiwgChV9UyIRuBzwYFLmPAM2SwvUZYtjuy2NGtO8cvDXUnYWBHO5fWNPlKiu
 6EkxpcLansA1RIjsOZ135vT35eFaupy+yi8yjXf0gdN35QDDiJQ5pWwIHxRQ==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=google.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=google.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=google.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=google.com
 policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id E012C43AF7
	for <nouveau@lists.freedesktop.org>; Thu,  8 Jan 2026 15:59:26 +0000 (UTC)
Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com
 [209.85.221.74])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 808F810E790
	for <nouveau@lists.freedesktop.org>; Thu,  8 Jan 2026 16:07:44 +0000 (UTC)
Received: by mail-wr1-f74.google.com with SMTP id
 ffacd0b85a97d-432c05971c6so1488746f8f.1
        for <nouveau@lists.freedesktop.org>;
 Thu, 08 Jan 2026 08:07:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767888463; x=1768493263;
 darn=lists.freedesktop.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GgFTUVqrsSYoJNwoFQtQbYpFqJVNoWHrRDOGPnWEKHg=;
        b=Jk+B4jyOvOuXxgeUpRzb7YIjkGjGJ1NbhNgZmxRYFmp81daBUzVdz1EEqT7bMGfzeY
         8hJQbIWG95wDR8BjSQ9mJ1hMnnGn/PvUqkHbPNkwKHmOND54J0x3ARvf7BYGH6K/ugvd
         VCt0ZjoygON1r6xGKIEMh7PEbHEKQStuRfBaboecjCaKUiEB571V+ETtR1R7LTnSSEdh
         P6Hir3y57P9wfM/wUAXeBibIDks5d4uvPPaIlCE30ZGRdkYKuHPgbDoppC7bPkdESaEB
         1NXCTvCYX7TOUXVZZOaZOOYLs3Fn0UOzYgJFPmJJgUvCBbOeuV8FX021gw0YdRB4jJY4
         1qnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767888463; x=1768493263;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GgFTUVqrsSYoJNwoFQtQbYpFqJVNoWHrRDOGPnWEKHg=;
        b=uoAUKi53R+ao5gwe+DrrS8Nyoi5pqrauDwl3ReoUQCyO38SHBrcXKTAe5p//EwXVB4
         m1BzXFUi27WvqkFtRlxhvHgYXF139GIXmlL5NwEdprdCDPkvJBDmlt68BdmVHXjRf68d
         NtUHc2sAfl6N7HOa+r0RFiLBK49IylO+0dmWVKZJ1BhVPSDgT95dx71j4bKuub2popkE
         GydKzLP2xQrGhVZ26NHFOyDWoycjnWwZ4S3fhMcjqCEo32Bv5/YHDP/iloQ0EQvlL4NQ
         Rc86P/MJFv/KGhiG3UL2aKTuUB4hZwsiC8RPYkPeInb7M3Tbmgkm+3XvQtM4p3yEwgbm
         MeEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWFwiMeDzU3/hfmQEf4dWFEWJ644UWhbunUNPDCHp4QFm1vtVdaGoTwoMziNOEaTyC4v+QY4sCC@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyPt/j5vgb3bncwd0jJlZpWGaZZBRjdCwkm8ovHkfvyF5HmND4F
	KsAKEfeianzkPeADxj3kYhifnheXVwb30ymEZLTe2fypTRNyyag7TJTtsP+NATHJrSjiZFQn+82
	FRNkHrFlN5JtMYwIv7w==
X-Google-Smtp-Source: 
 AGHT+IELwgIWCY/J1hvJcROgHHhPtNfYmVFPy3DR5T4AF6N3+oYhJGrZ8GFSbPrxOSUZVlJIw2ilobL0+dO9O/E=
X-Received: from wrbay21.prod.google.com ([2002:a5d:6f15:0:b0:430:f9bd:2c6a])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2207:b0:429:b963:cdd5 with SMTP id
 ffacd0b85a97d-432c362bf78mr8482438f8f.5.1767888462740;
 Thu, 08 Jan 2026 08:07:42 -0800 (PST)
Date: Thu, 08 Jan 2026 16:07:30 +0000
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAELWX2kC/23MQQ7CIBCF4as0sxYDo1J15T1MF0AHSmJLAy3RN
 Nxd7Nrl/5L3bZAoekpwbzaIlH3yYaqBhwbMoCZHzPe1ATlehMArc/OaRxbXtDDdiptRBlvVS6i
 HOZL17x17drUHn5YQP7udxW/9y2TBOCNtpdQWT2fiDxeCe9HRhBG6UsoXJH5RoKUAAAA=
X-Change-Id: 20251128-gpuvm-rust-b719cac27ad6
X-Developer-Key: i=aliceryhl@google.com; a=openpgp;
 fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1173; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=snxThI8cYlPfWm0VQSv1csU1h0GPhmXiSH+DK97/5yY=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpX9ZH3Tr28HEcClQ+ZDYSEkR/L6fUjzsnzmv5F
 BeIx0yoLAKJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaV/WRwAKCRAEWL7uWMY5
 Rt0REAChUrcJne916D6faDvqGiRD5g231h04N9otKKhmpsWolA2a/ys2BTZD3POx29KNCGGwvon
 rqbEXw+izw0oLt8nyONEyDJ0FQEzYNg3U3XCwhcafeEAwjXPl/qShu2jZqWKJpckQbpZfrxMBP5
 RAjMWIalnaE9hAQGspLSNAatkA1Dp/mAA7/zZFc2+mRr3BzsnRMOHZNJoIxQWwdAmXAHjdy4nvC
 cUHwu1MetM2WGhE9cNzEB84RdpIc59o68meuQ4a0odTAt2r2yIdpcLSgQIGgefFrYhCstjzFy8/
 hIWLbWwxUfP6l3Ie0u09nLOHn8/tHETnuZ4soTrvi7bBIsBIhgibrnFyefgrRPUdl+g5vkZbS87
 xoqIjxnjwBJYD7QrIw04iFmCSArVo1bjZ8piHoXzCmwDJhI4rc326Lm5pO8ivgdz7o/i8UiBEF3
 MywNzDyTMwsUjle/HG2/Z5lhRpT+Chm5BCjtirWXP3EAp0h1wJcsH8AF1avryc5CqDVIBBU6kc5
 sweGcqQFhTo5Ra5bDr2K9LENRjSmkHwzmHFnipDJph8IELNzuEdGGeba2EGzaszhlCzmTENVrbb
 vx9a86rmbiUuivhvyCcNbH8dRQG7mvTc3kLjBaRKM8UmIVKm95dXUMV9sYrIm0rJurciOILvVyx
 gsvtgtvLv6p7qBA==
X-Mailer: b4 0.14.2
Message-ID: <20260108-gpuvm-rust-v2-0-dbd014005a0b@google.com>
Subject: [PATCH v2 0/3] Rust GPUVM prerequisites
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>,
 Daniel Almeida <daniel.almeida@collabora.com>
Content-Type: text/plain; charset="utf-8"
Message-ID-Hash: K2RGWRGJGW5VLBXAXC7OZIPGGUYXYC2P
X-Message-ID-Hash: K2RGWRGJGW5VLBXAXC7OZIPGGUYXYC2P
X-MailFrom: 
 3TtZfaQkKB8sr2ztv8Fy2x55x2v.t5345BCvrB2z9A9.w8vvuv91A56.58x@flex--aliceryhl.bounces.google.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Matthew Brost <matthew.brost@intel.com>,
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, Frank Binns <frank.binns@imgtec.com>,
 Matt Coster <matt.coster@imgtec.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-media@vger.kernel.org,
 Alice Ryhl <aliceryhl@google.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/K2RGWRGJGW5VLBXAXC7OZIPGGUYXYC2P/>
Archived-At: 
 <https://lore.freedesktop.org/20260108-gpuvm-rust-v2-0-dbd014005a0b@google.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

See v1 for the Rust code that uses these C changes.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Changes in v2:
- For this version, only the C prerequisites are included. Rust will be
  sent as follow-up.
- Link to v1: https://lore.kernel.org/r/20251128-gpuvm-rust-v1-0-ebf66bf234e0@google.com

---
Alice Ryhl (3):
      drm/gpuvm: take GEM lock inside drm_gpuvm_bo_obtain_prealloc()
      drm/gpuvm: drm_gpuvm_bo_obtain() requires lock and staged mode
      drm/gpuvm: use const for drm_gpuva_op_* ptrs

 drivers/gpu/drm/drm_gpuvm.c            | 91 ++++++++++++++++++++++++----------
 drivers/gpu/drm/imagination/pvr_vm.c   |  2 +-
 drivers/gpu/drm/msm/msm_gem.h          |  2 +-
 drivers/gpu/drm/msm/msm_gem_vma.c      |  2 +-
 drivers/gpu/drm/nouveau/nouveau_uvmm.c |  2 +-
 drivers/gpu/drm/panthor/panthor_mmu.c  | 10 ----
 drivers/gpu/drm/xe/xe_vm.c             |  4 +-
 include/drm/drm_gpuvm.h                | 12 ++---
 8 files changed, 76 insertions(+), 49 deletions(-)
---
base-commit: 44e4c88951fa9c73bfbde8269e443ea5343dd2af
change-id: 20251128-gpuvm-rust-b719cac27ad6

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

