Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BABABA37C38
	for <lists+nouveau@lfdr.de>; Mon, 17 Feb 2025 08:31:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83EB910E13E;
	Mon, 17 Feb 2025 07:31:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="H5WJfbho";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E77C110E13E
 for <nouveau@lists.freedesktop.org>; Mon, 17 Feb 2025 07:31:26 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-abb892fe379so163283466b.0
 for <nouveau@lists.freedesktop.org>; Sun, 16 Feb 2025 23:31:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739777485; x=1740382285; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=i3N1F9lKBugdIVSZf0JnXa3f5AJ+PHptBaxL337Q39w=;
 b=H5WJfbhowuk3rUP0XLX059BSh6tfYcmUDNhE0Cqw1wlVdB6xK6i7mlqjgqA3AUqR4R
 tpiP+jIcmPsb41oXHUGAlW+DxX83u0DrtQVzoRSXzzygvTZVw2KYw3BZeCSXhOIW2cTe
 n2Y4T5/ZWLjwWYAXhYrQ8LgQjYyFhCG+3+QBjhPZ3ImbGEYJOrmulj2oEbelWL0Fp9aO
 nnUDWxWopEeIIGPHC/UmMEDAkQbIMCh/0+R53n9mMo4qeUPfo8sruT1duPlJUIBSWgHT
 OdHmal4wS5kVnninRU4pwv4mlVnhDJ8BkQD5yWj3da0iqQub9C6VNXb7aA26krA9iVO7
 hIAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739777485; x=1740382285;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=i3N1F9lKBugdIVSZf0JnXa3f5AJ+PHptBaxL337Q39w=;
 b=oeoGmydmExFhNydYn/tZHRtniuvYXiPB8G43/Si+BwaIMuIr1tcepOESbRIkkEw0db
 omClf3OlYDpzgP0bnhihUFTEpGrYzsNYZIboD+716Fr3UOeVSeSz7t5BoNumgmpPV2mS
 +E93BIQhCq47QQ2SlobYPqlNzGnbzSmNi7+I3pR+mWVMCbk7Fnu+f5juwLr2cKzdZAjq
 FevyS6ijsBVUJrQ4azXXUd0ivZoCk2ktIBA5hJKr7cTWdnKiUOQ/Aoh7bWltgG955Yx4
 Kotw6Myd6iWjxpuWnvd2ESkl+yqL8n4xpKuT5lQzQYyKpGFUJxZUXRQC8JknVyf5DkwY
 OcGA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNzQPrS80MB0pwJk58bT5uS7dR7NbLVy+hSs6kwTSzmz74DgqyEb4J461pIMV7dY3qcmM2WSVM@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxBytN0F9nUDm3NqWH2/yqYxYiO6OevA7rEzgPkInB3Bh8JbgBZ
 oA0rZVdh7CcGlNlO5bU2/sAYlvVvi950pGuEouJgWqFW1fMbTsGoPQNkVNotfcg=
X-Gm-Gg: ASbGncuWoCR5d2iKRqkriuxILavRubyA9bbMlh4Rj4rQEFAXyYjDHniQEvbC5herH5O
 a00owm+ngzTpEajcryzHG2d4F5ygq6vQMILk/N5k4VM/rbpKaFNAtNGqsizY+LOmv29g0XvFF3D
 eCTndyTy+YzH7+fLI4WCXVLmgsVke+g8ITeEZKdelkTlT/m+fI6FzDi/6A48A621R3ncEo40GW9
 UpkzGW9GRsv1vB5UeE8j/nscjo/iXvHVE2wqZ5St+aTkAHu/oKYqCqLCSWsE/skz5hcr1cOr7ZN
 QBuSHAJirvvP0ISh3QGF
X-Google-Smtp-Source: AGHT+IHnHjxlo58ZzOxdeP7u7lyqoH4uJ6/5PcUK9k1FokcbI7i8gKzpjfAHODR2Y8cP+hgufV5HRA==
X-Received: by 2002:a05:6402:3589:b0:5dc:9589:9f64 with SMTP id
 4fb4d7f45d1cf-5e03602f759mr19286982a12.13.1739777485351; 
 Sun, 16 Feb 2025 23:31:25 -0800 (PST)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-aba532322c4sm830991766b.34.2025.02.16.23.31.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Feb 2025 23:31:24 -0800 (PST)
Date: Mon, 17 Feb 2025 10:31:21 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Zhi Wang <zhiw@nvidia.com>
Cc: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Timur Tabi <ttabi@nvidia.com>, Dave Airlie <airlied@redhat.com>,
 Ben Skeggs <bskeggs@nvidia.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: [PATCH next] drm/nouveau: Fix error pointer dereference in
 r535_gsp_msgq_recv()
Message-ID: <b7052ac0-98e4-433b-ad58-f563bf51858c@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
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

If "rpc" is an error pointer then return directly.  Otherwise it leads
to an error pointer dereference.

Fixes: 50f290053d79 ("drm/nouveau: support handling the return of large GSP message")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
index 2075cad63805..db2602e88006 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
@@ -348,6 +348,7 @@ r535_gsp_msgq_recv(struct nvkm_gsp *gsp, u32 gsp_rpc_len, int *retries)
 	if (IS_ERR(buf)) {
 		kvfree(info.gsp_rpc_buf);
 		info.gsp_rpc_buf = NULL;
+		return buf;
 	}
 
 	if (expected <= max_rpc_size)
-- 
2.47.2

