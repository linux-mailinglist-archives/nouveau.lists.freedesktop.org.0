Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE696BE63FA
	for <lists+nouveau@lfdr.de>; Fri, 17 Oct 2025 06:05:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DE2110EAEC;
	Fri, 17 Oct 2025 04:05:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="kMJIjgPc";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00D6710EAEC
 for <nouveau@lists.freedesktop.org>; Fri, 17 Oct 2025 04:05:01 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-27c369f898fso20639975ad.3
 for <nouveau@lists.freedesktop.org>; Thu, 16 Oct 2025 21:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760673901; x=1761278701; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=0yTr8XYfVKTbUORpK+gdA/VSO6LmqQtreJ6mNFyN7AA=;
 b=kMJIjgPc4sQoTbBpDIyD13o5OoDdWtznFIKBlT9z1MA8rFXQM37YOn8GJF071dE2UK
 UrYha9vUOcN28IhcRnz+9s2SypC9gxMGi7588rZgzIX6zsbPGA1/aAwsGb6gUrt0kYoh
 UxeYFnN7FJQ0ap/IpKJv19eEGjLGPbZD/8hokw74Ja60BiOt0M8zf3nj3hDDeTv9JSgJ
 Mp/2sltEW1wgG1pkkWC46qs7eExYQffGgyKGu+b+pdH220zVDgG3gcHBOc9G+oqEHP9M
 G/1v5kASgfDp0BkonGwnuRBA+FmHKjkBXm1rC7kWhfMI5QN/I7U0XPVVGSTg8ri4LoGM
 10XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760673901; x=1761278701;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0yTr8XYfVKTbUORpK+gdA/VSO6LmqQtreJ6mNFyN7AA=;
 b=tREMU+uGa+FAqYd6yk7kLEJb3wcZCJZJvZNCv6vXyFEhiCNjf0M7JRw+WmsGEUMiXN
 2IcgEdUYn88tfA9uzSejG+waKwsh+4pia+zKLVn4CS8poDCaJmLiHAKcbvuGqK+m9dJ8
 RBYL8133dxWkMWD+SGbl4CcPKJ1ZeOvxKP3OocbUhmPipg0O+dw75GFeLtkrza2hi0zv
 r6E+fu7+kdpMs4JacIDW2zqx24nTK4Dv1/aJoqRFkgBUCnA0DncboftqVHrQOE0ReXJW
 LoP5FLifmCVIwE1Efgaip8ezqhWo9ZPFYdOg+cmbwPy2+Ya469Qcrb05JsSqsnZ15cxy
 aqXg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4Fdbuj9NjWA2akqb4vxO37t/T975d761nxs2uSrQnUzuvjbUS2QqaWaHruEdG2D5U0Y67/V5K@lists.freedesktop.org
X-Gm-Message-State: AOJu0YydHypsHr2HfysErEXRbjjkNr/TuF1nOongFnO3EUkgXFReFG3s
 odGy73S0l4fxtoaWdyOnwfRrGYwIhACocQHV38HnUgJQCqURLcDkQLOVqUnr7IiMGRs=
X-Gm-Gg: ASbGnct9UGpAp3VZggi2KPzu0sKUxJBLtdCDW4J8TQeCDVGHOhQHisAwTWwsNkBNrpL
 BvoTtlKuB1E+GWa70j53c8XodJ9uNyGLsOSsj+xAPfxMAV11uOAPM6w4bDF83dTKpWIBAfob4pE
 kLlx3pAIEe502VUsdPboQnvec4lGx/onn7zG1KwdT52ZZHFaWTWmF+uvsm1AChGQz4DF8zZO9Tt
 WzDb4OIw69rR8PeigxjjLigh2QDw4rouVhZtJc5hKjWN8237/SfHvABOLXniMG9iYY5XQuavfhz
 iXAiunLB37/r5c2XEbuip5/8OynScUsYFooFA9QNdz5z3qhjC/+dlTibrn3iDbThLBbmabFzQDS
 djIvJwqPx9hcjNWAXxv2hLiifT8O+sGl/+9LyaQozYKhIpbeJLcwBNnJfYYxv9nSRFR5n8m7V95
 whIQ==
X-Google-Smtp-Source: AGHT+IGPSjlNzo0y0i/+GbYPAiFlc7JbgHfBpNrj/C4bxPOi+I7rIKsQiv4+wobJzyD79esO6O++kw==
X-Received: by 2002:a17:903:1746:b0:28e:7ea4:2023 with SMTP id
 d9443c01a7336-290cb07d430mr27595565ad.46.1760673901015; 
 Thu, 16 Oct 2025 21:05:01 -0700 (PDT)
Received: from localhost ([122.172.87.183]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-290cd93f570sm13832535ad.25.2025.10.16.21.04.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Oct 2025 21:05:00 -0700 (PDT)
Date: Fri, 17 Oct 2025 09:34:58 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, acourbot@nvidia.com, 
 ira.weiny@intel.com, leon@kernel.org, daniel.almeida@collabora.com, 
 bhelgaas@google.com, kwilczynski@kernel.org, abdiel.janulgue@gmail.com, 
 robin.murphy@arm.com, ojeda@kernel.org, alex.gaynor@gmail.com,
 boqun.feng@gmail.com, 
 gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
 a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, 
 rust-for-linux@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-pm@vger.kernel.org, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: driver: let probe() return impl PinInit<Self, Error>
Message-ID: <co76tfqycdxhrigoxv5expmozqzgq2rjzxvfkfwqzyvlplrfih@gsi5yarmilut>
References: <20251016125544.15559-1-dakr@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251016125544.15559-1-dakr@kernel.org>
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

On 16-10-25, 14:55, Danilo Krummrich wrote:
>  drivers/cpufreq/rcpufreq_dt.rs        |  4 +-
>  rust/kernel/cpufreq.rs                |  4 +-

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
