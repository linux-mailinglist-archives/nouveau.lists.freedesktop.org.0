Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62FA2AD2B13
	for <lists+nouveau@lfdr.de>; Tue, 10 Jun 2025 02:57:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBBDA10E455;
	Tue, 10 Jun 2025 00:57:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="pczteVAr";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5464610E24A
 for <nouveau@lists.freedesktop.org>; Tue, 10 Jun 2025 00:57:24 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-235f9e87f78so44163755ad.2
 for <nouveau@lists.freedesktop.org>; Mon, 09 Jun 2025 17:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1749517044; x=1750121844; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=c1rQwYkfS8VPR2HtcdFz5xQMJ3QnFjshutUNq6gvzdg=;
 b=pczteVAreoZvdfekcsgjCTEgOBLPGJULMQ1PjFTPLaGBo000DZZzvnE7pS+MbuaHMt
 kRglpEUc1yhd8sZmw4dFySrnRkdIUqJxWaP2suD3aN6CHx2OY9hKNv7C9w9M8RtHa3kK
 DkpfaWA6HqWsMUv35g8jE+8hBfbOjjYkNFL3KoWJisAteWeqOnZyvDmVpKKqG08B99yz
 Y4cOHhjkkU9//XjBeUBiWuzDMKhup7MyIMDDLk/v6h9xOa97j3e87ILXstv84vEGfOfO
 2PUMkYnbGaLM0NCVXy1OBVPPVGhjY2Nf6Xi5FWIjucrDIWT0na26s6ZsRv7t3tFlV/lQ
 bOHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749517044; x=1750121844;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c1rQwYkfS8VPR2HtcdFz5xQMJ3QnFjshutUNq6gvzdg=;
 b=vRytTgLO39auTLnGmzyTEIcjAO3C3w0/JJEgFUTyBQ0zZWQJxzeny7PM3ZCSFcJ/Yg
 0MLoy+ENhjpf2aeJYwbA/RzYs+/mmz0hnLzZYqAYV6TeoRb3WET21TaIoP8hzKiTa4fD
 zgFfFGaPyw0nn6zQ6UWTTy/9LE/DYIiyGS8cL6O/olyWD6wUQ6UW+0wH6MvrqWmZ2yri
 bXxm4czLoHts+FlGxO5cVQw+XA4qaxajMGZBAo6gTCXEZqHIqTDqjPmW4Si0mmLByw1g
 7tGrFQYu7QuKET6F3zKrzo1XwLzb4iPGvzBwrpGtYvunzRQSn/o6UHIkeOTqqQZE9J6u
 U1jA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXGzyCkhl81QgBgmvxUfVgW2r2+j5hlkpVHvmxAXcoo6tSfu9VVzwjjBccMU6dnciEzLFevb5UV@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwSKxlVhySx1O0b1ZceG5Lq0e/6ygpa6593LRF4I6AMmSA0Smn9
 gUaVp4DxiwuWOiNwzYDrnP8WE7Py0+W3frDHwZmK0lW/z2SlgzSmyMxHPviMMF1lq6E=
X-Gm-Gg: ASbGncvya4bRYtFqhl0UK0dUvQbIXqbj/kpNWtZ8t4BIaUTcRWKAXbdDTAEKRc8mHKw
 ZqFAslPlLGlSmvacSTqnLUGYhKEBmpkIL7Pd24mdDWPENjKFtH1sZ1u3BrGexv+7PMFTIMr4u7R
 O+zHgvntd+BNksXLq+7Zj+za4YStU8w+kcgedHtj6g2lCseWOuxMr96e98XdUU41BAlLunHpnlo
 dXojVuSiLYL7eIvznm01EySpNf31lNX4bA9Vf8OD12kr0c3tbqxW/IebiqJE/klhVm02gNT/Se0
 mf8NN29nIo0EqB+AYtJWvRDLek5me0S7lnX5rb4zv1Htpb1kIHxxaa+bLH8gH3g=
X-Google-Smtp-Source: AGHT+IEdl8eeFf7aJp3yaKtzoKAh6ceNn/qekzHSRC0NuzHU4sIrFSD+owbOXJVQKsMXXNVfTFyxWg==
X-Received: by 2002:a17:903:2c9:b0:234:d778:13fa with SMTP id
 d9443c01a7336-23601d13585mr206171875ad.26.1749517043866; 
 Mon, 09 Jun 2025 17:57:23 -0700 (PDT)
Received: from localhost ([122.172.81.72]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-236037ae33dsm60076015ad.206.2025.06.09.17.57.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jun 2025 17:57:23 -0700 (PDT)
Date: Tue, 10 Jun 2025 06:27:17 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>
Cc: rafael@kernel.org, dakr@kernel.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, mcgrof@kernel.org, russ.weight@linux.dev,
 ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org,
 a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
 leitao@debian.org, gregkh@linuxfoundation.org,
 david.m.ertman@intel.com, ira.weiny@intel.com, leon@kernel.org,
 fujita.tomonori@gmail.com, tamird@gmail.com,
 igor.korotin.linux@gmail.com, walmeida@microsoft.com,
 anisse@astier.eu, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] rust: module: remove deprecated author key
Message-ID: <20250610005717.kd32qk7jvrioyds3@vireshk-i7>
References: <20250609122200.179307-1-trintaeoitogc@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609122200.179307-1-trintaeoitogc@gmail.com>
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

On 09-06-25, 09:22, Guilherme Giacomo Simoes wrote:
> Commit 38559da6afb2 ("rust: module: introduce `authors` key") introduced
> a new `authors` key to support multiple module authors, while keeping
> the old `author` key for backward compatibility.
> 
> Now that all in-tree modules have migrated to `authors`, remove:
> 1. The deprecated `author` key support from the module macro
> 2. Legacy `author` entries from remaining modules
> 
> Signed-off-by: Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>
> ---
>  drivers/cpufreq/rcpufreq_dt.rs        | 2 +-
 
> diff --git a/drivers/cpufreq/rcpufreq_dt.rs b/drivers/cpufreq/rcpufreq_dt.rs
> index 94ed81644fe1..bdf4b844de42 100644
> --- a/drivers/cpufreq/rcpufreq_dt.rs
> +++ b/drivers/cpufreq/rcpufreq_dt.rs
> @@ -220,7 +220,7 @@ fn probe(
>  module_platform_driver! {
>      type: CPUFreqDTDriver,
>      name: "cpufreq-dt",
> -    author: "Viresh Kumar <viresh.kumar@linaro.org>",
> +    authors: ["Viresh Kumar <viresh.kumar@linaro.org>"],
>      description: "Generic CPUFreq DT driver",
>      license: "GPL v2",
>  }

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
