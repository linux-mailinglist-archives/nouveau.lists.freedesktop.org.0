Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7657BD4DD
	for <lists+nouveau@lfdr.de>; Mon,  9 Oct 2023 10:06:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC6E510E229;
	Mon,  9 Oct 2023 08:05:48 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29FB510E195
 for <nouveau@lists.freedesktop.org>; Sun,  8 Oct 2023 14:01:29 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2c17de836fbso46635141fa.1
 for <nouveau@lists.freedesktop.org>; Sun, 08 Oct 2023 07:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696773687; x=1697378487; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=zxakH265LpATzSTaf30OW9So30zUQfcE2yrNl/MhWDo=;
 b=OK61mQ8jqLGUke1cuPXx8NXCdLPNvyoTrR7SeDFVNjKoxG1Mz6EipnwL8t+GjVmaDg
 bBoxuTKfLmFuMJ1RGP1DqvD43wgRo2TEUQVz22LsyVqkuV+6ouI4rJNqM3m9bgqYEhfD
 jF3ULFaA9I8yhgDmGNjtx0jlRZIf1pZd2R8m5PDnBZY/QV5wAMi4bVLJ29BKx5Zyhqhh
 BzFGOHVRSnswkXL7/ZvooqutSGX15CRExpXKyfSGSQAuOKew+8NKNDF7SzSDoPIs4ZwS
 UxCwJaUqTF6NpkLwGdJW4Gvm122hlQh7occexF1UDeBqxA6oi8TssMOLgttPO4g1xP5T
 GVgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696773687; x=1697378487;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zxakH265LpATzSTaf30OW9So30zUQfcE2yrNl/MhWDo=;
 b=kVeoK88LROqBLDOq92i1k/hSgxHHiQIWft0Q8um4MONKVGOaglTWNlqKMcfBKAhLyd
 +deAnku8w+GjxXLl7gdLUuxmpd/HDQOgMva7xjHEccFJ+ccSsjV1YMAhHmaTqlPQVOKz
 eN1TGWOBp6gdesaBd1lB9BtrRzegdma9vMWHwPzlzxlI7c7BRlf8+B0F0pcq/WE3I0wi
 tsmRP4Sx+SayTmB98q+iJMqQIy8TU4Dyg/EUWAPr3/IIrz64SrBpLGRkZCuSYv0PU3sh
 M3qmR/qBN2buJdiXqBy6ESAq1Nm/no2I2oKXpaEHTCMg57+d1opaIeGZ5A6958r4Ze97
 CQ5g==
X-Gm-Message-State: AOJu0YyKhUrlTCnQz1FTvzucGZFt5AfZ8wYA68TWmD5j14wCBVRe3cDr
 f73ktvMIpL3+/wExHBPF53aBjA==
X-Google-Smtp-Source: AGHT+IEZhcTkbfnDMA0TmtMUY6GUYhyBTjDeQoEWBa7c/RqNiiO7pOQy12FcGXqIQaqK7WTV5qhK2g==
X-Received: by 2002:a19:910c:0:b0:501:c1d4:cf68 with SMTP id
 t12-20020a19910c000000b00501c1d4cf68mr9460445lfd.15.1696773687355; 
 Sun, 08 Oct 2023 07:01:27 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 q14-20020ac24a6e000000b00504211d2a73sm1080455lfp.230.2023.10.08.07.01.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Oct 2023 07:01:26 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Felix.Kuehling@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, harry.wentland@amd.com, sunpeng.li@amd.com,
 Rodrigo.Siqueira@amd.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, inki.dae@samsung.com,
 sw0312.kim@samsung.com, kyungmin.park@samsung.com,
 krzysztof.kozlowski@linaro.org, alim.akhtar@samsung.com,
 robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run,
 marijn.suijten@somainline.org, bskeggs@redhat.com, kherbst@redhat.com,
 lyude@redhat.com, kraxel@redhat.com, gurchetansingh@chromium.org,
 olvaffe@gmail.com, paulo.miguel.almeida.rodenas@gmail.com,
 wenjing.liu@amd.com, haoping.liu@amd.com, Charlene.Liu@amd.com,
 chiahsuan.chung@amd.com, george.shen@amd.com, sancchen@amd.com,
 tony.tascioglu@amd.com, jaehyun.chung@amd.com, tales.aparecida@gmail.com,
 drv@mailo.com, aurabindo.pillai@amd.com, quic_vpolimer@quicinc.com,
 jiasheng@iscas.ac.cn, noralf@tronnes.org, jose.exposito89@gmail.com,
 javierm@redhat.com, mairacanal@riseup.net, davidgow@google.com,
 arthurgrillo@riseup.net, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org,
 Ruan Jinjie <ruanjinjie@huawei.com>
Date: Sun,  8 Oct 2023 17:01:18 +0300
Message-Id: <169677306919.2570646.8217027380730287216.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230809034445.434902-1-ruanjinjie@huawei.com>
References: <20230809034445.434902-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 09 Oct 2023 08:05:46 +0000
Subject: Re: [Nouveau] [PATCH -next 0/7] drm: Remove many unnecessary NULL
 values
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


On Wed, 09 Aug 2023 11:44:38 +0800, Ruan Jinjie wrote:
> The NULL initialization of the pointers assigned by kzalloc() or
> kunit_kzalloc() first is not necessary, because if the kzalloc() or
> kunit_kzalloc() failed, the pointers will be assigned NULL, otherwise
> it works as usual. so remove it.
> 
> Ruan Jinjie (7):
>   drm/amdkfd: Remove unnecessary NULL values
>   drm/amd/display: Remove unnecessary NULL values
>   drm/msm: Remove unnecessary NULL values
>   drm/radeon: Remove unnecessary NULL values
>   drm/virtio: Remove an unnecessary NULL value
>   drm/format-helper: Remove unnecessary NULL values
>   drm: Remove unnecessary NULL values
> 
> [...]

Applied, thanks!

[3/7] drm/msm: Remove unnecessary NULL values
      https://gitlab.freedesktop.org/lumag/msm/-/commit/92a48b6ed510

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
