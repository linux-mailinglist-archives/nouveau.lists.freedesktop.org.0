Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 406427AB797
	for <lists+nouveau@lfdr.de>; Fri, 22 Sep 2023 19:33:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD6B110E6BD;
	Fri, 22 Sep 2023 17:32:59 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E91D010E6BE
 for <nouveau@lists.freedesktop.org>; Fri, 22 Sep 2023 17:32:19 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-1c44a25bd0bso28515565ad.0
 for <nouveau@lists.freedesktop.org>; Fri, 22 Sep 2023 10:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1695403939; x=1696008739;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a+ctTEyoq7sOv+FAZHxESomcnOOr3ZQuAJoEIOqh0C4=;
 b=Bg1JoqmeszBQYiEs9zR8EwDflyoMk8UWycHq9gTeUd1dewLTemNj/kpRwrA73TOI4A
 GcI0Dw3VOfsoZs/WHYJ0Y2uhybzyK2/vGdNmc08TpciI4ubetHwex+/LUm4SMJs5h8Wj
 QmEnOxfEdoMffTIZHV6ehhvk9myfivjQCWPh4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695403939; x=1696008739;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a+ctTEyoq7sOv+FAZHxESomcnOOr3ZQuAJoEIOqh0C4=;
 b=O6Q99HnezQfqa6gojvu1CiP2mhBjhl4TEvP5uLr87cyMh5r4Q9JwpGbqAiYPl8bpY2
 FIAS5/88/4rrpEr9aJUgsP3aY8yL0mlAXtqrpMxOO6gu5jXX3kAVD5DuotrqfcK2hX4w
 DqEIxDDYXYqzHzde2ZemmIQ8uapg+7RCocXK0wHFZkoaAtjC+Zbb2+8tUddz99MoynEb
 0DatVobP7E9J8eOub7a/u5eLLlRFDnnPqV9UVQaWQQcq6MB8i3lCihmEqFnBI/NHqg8A
 79K6cV2mi14ZFrkeY68xgF3dn0U60zWB8GNkRz+zQmNoaL4FnJjH6UJObQL/1CBXeX8k
 xeHQ==
X-Gm-Message-State: AOJu0YwS7cn1kWhYyXEx8XMlBGQWYEnpc7/G1L/vVpHsH9davu9evzLE
 a08nYBzQ4WTtMaBtmVbuEbfkPA==
X-Google-Smtp-Source: AGHT+IGC6/6NdvEqz8he++fdJuEaamt9Op5nnYZ05uajn7JWoal4nRh6sAA+e6vH/dWEyyl5jl0kkA==
X-Received: by 2002:a17:903:32cf:b0:1c0:e87e:52ba with SMTP id
 i15-20020a17090332cf00b001c0e87e52bamr547482plr.2.1695403939425; 
 Fri, 22 Sep 2023 10:32:19 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241]) by smtp.gmail.com with ESMTPSA id
 j5-20020a170902da8500b001c57aac6e5esm3763379plx.23.2023.09.22.10.32.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Sep 2023 10:32:17 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: David Airlie <airlied@gmail.com>
Date: Fri, 22 Sep 2023 10:32:07 -0700
Message-Id: <20230922173216.3823169-2-keescook@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230922173110.work.084-kees@kernel.org>
References: <20230922173110.work.084-kees@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1428; i=keescook@chromium.org; 
 h=from:subject;
 bh=i2UpbGfuADbvlbxlhkLDZa/xyj6FED75tdnO2fZlmjo=; 
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlDc+dEehHl9nbm4bhCFwpbMmpO3Xxql5kFxhRj
 Diayf24WdaJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZQ3PnQAKCRCJcvTf3G3A
 JvkkEACyRaaPJcAJJrT69OHPNJ7Sh8M7AKH2fzwSzceuPqxB6RysYYS6VR2iPdaDZg9zSS+vTbb
 fL60uv9o1ah81G8VJPhZppP9CtgmmA8a42Bpbs53luiTn/LGzycDXWPETOIgJGNsrJMgTFQyPMo
 241VVShLmM8kxtLnJkLOnDZEqzjh4lSZG5ygNcH9YpR0LH3S9yhYSaBm0oamf3UpID1Xs/g89RE
 2GjQlWgZzPdM7WCNcNNAIhK00fTWSD5DmnFGm50TziH8XWc8eGZZ2VknCk1GbO1UtJO7OW7lysZ
 dzxYyw9Eifo8NVwr14wp43rm0towIlCQv++/9z7OLpwblt6E0YNRNpTjv9DQV+xS5euSf4ETfjV
 IJ9vdSq6WjnidZkTBKdhROCuszJxRQ9b3HqXm169h7IYEdXvDeMvTQ2xgv9UwiFYpPlLImhrCYh
 r/oOkRSzfxf22LJvTsqX/WXIRpOCLm1gQa2ApJjyfzEXAegAaVehjC7856bxlgo+pE5tqm7PAvm
 JLb5hweD/O8L+7Tf7ij2oggZ9HmU2VGBIGVs0/EP7R6GeKLWO5KBBVa3/aADP01hJ2ZTfyjJsLl
 NqBiuVwLDZSWs6x18B1633XvJJtLwLIUg5eA8U/N4Q1qXUMezt3ySBuq4TSxO56Xod8iBUwzCfw
 TsBbpN+0JCLa/Ag==
X-Developer-Key: i=keescook@chromium.org; a=openpgp;
 fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH 2/9] drm/amdgpu/discovery: Annotate struct
 ip_hw_instance with __counted_by
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
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>, Emma Anholt <emma@anholt.net>,
 Tom Rix <trix@redhat.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 llvm@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>, Prike Liang <Prike.Liang@amd.com>,
 Huang Rui <ray.huang@amd.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, amd-gfx@lists.freedesktop.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Nathan Chancellor <nathan@kernel.org>,
 VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
 Ben Skeggs <bskeggs@redhat.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 nouveau@lists.freedesktop.org, David Airlie <airlied@redhat.com>,
 virtualization@lists.linux-foundation.org, Chia-I Wu <olvaffe@gmail.com>,
 linux-hardening@vger.kernel.org, Lijo Lazar <lijo.lazar@amd.com>,
 Kees Cook <keescook@chromium.org>, Yifan Zhang <yifan1.zhang@amd.com>,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 Kevin Wang <kevin1.wang@amd.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Melissa Wen <mwen@igalia.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Maxime Ripard <mripard@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Evan Quan <evan.quan@amd.com>, Sean Paul <sean@poorly.run>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Xiaojian Du <Xiaojian.Du@amd.com>, Le Ma <le.ma@amd.com>,
 freedreno@lists.freedesktop.org, Bjorn Andersson <andersson@kernel.org>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Zack Rusin <zackr@vmware.com>, Daniel Vetter <daniel@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>, Nirmoy Das <nirmoy.das@intel.com>,
 Lang Yu <Lang.Yu@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 John Harrison <john.c.harrison@Intel.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
(for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct ip_hw_instance.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Hawking Zhang <Hawking.Zhang@amd.com>
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
index d1bc7b212520..be4c97a3d7bf 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
@@ -662,7 +662,7 @@ struct ip_hw_instance {
 	u8  harvest;
 
 	int num_base_addresses;
-	u32 base_addr[];
+	u32 base_addr[] __counted_by(num_base_addresses);
 };
 
 struct ip_hw_id {
-- 
2.34.1

