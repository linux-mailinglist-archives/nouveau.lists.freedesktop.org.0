Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB69CD0ABD
	for <lists+nouveau@lfdr.de>; Fri, 19 Dec 2025 16:59:50 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 50B3910F042;
	Fri, 19 Dec 2025 15:59:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GZI+KIIM";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 09993455C6;
	Fri, 19 Dec 2025 15:52:16 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1766159535;
 b=efGi1Soie1O4YfMu3JP8hUBN99jMa/kDQYKInMJG8WnNvX2NpR35DDskjSGXuO0ObyxlV
 /0QBLbILdnzN2P1/9HIsXsivzzg6v3ayWLD96ozGCMw9sVjnj6z4BdHXGNsAWKus5/pzzwd
 E68TEvKNM6dO7WTobC5EWGev3MADf4pwo+ObkerRrV3lSGryHaNwT0vX+IZS8UAmoyd1t6i
 wJIfqDhi/lG0wWYk2DB6a3UVU+ljTQbB9NQre3GQMNpsKksadxIaAphMeIGRFP0ATlXlJat
 LICPDtSRG4+f7O78ys/MnlWo5bb9l4UX3ek824c4R+xxSES/7Y7buHgY8gHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1766159535; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=aQA972iONaPUTTbgnIz+iSoWSorbh2pPa9/pzbiC86E=;
 b=ygCieHv2SD2giBDK6IBzdEVoE7MEIzJ0MycmG/hbG1uBEm1uP3GSj8Pa5u/2SOTqaRAuL
 XuOrK/e6cqLP87XQCOkW3gCPfkqqAobEsE+WjfQq05ehjFp/GevCN+PeZO2jpauec06z5OJ
 eFYMLcgLnTnYYBfxIxDHOzGjusS8U+2NdxtYVqa+9OosZ5XTuuO7IcLOsYQTNpmJ/RFCbgU
 KB9XJLju9yf3g1onek8wAAfzyKc8yTLk84iqOV8eBl/6b3qjn48GRCEUHi7UTesFTKxB3al
 j9Vv5KQ/grNjlmIN5F0N6RiZk2XcgVTXT0LJnrxT9iRtuvp6VaFIk1pjFC2Q==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=kernel.org;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=kernel.org;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 0D3AD44B96
	for <nouveau@lists.freedesktop.org>; Fri, 19 Dec 2025 12:07:42 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C037E10E3F7;
	Fri, 19 Dec 2025 12:15:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 53C5940651;
	Fri, 19 Dec 2025 12:15:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A36E2C4CEF1;
	Fri, 19 Dec 2025 12:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766146514;
	bh=zr3MOIdRIiLo5rQVA/Ls8ftqQmh9k+HKygN/fGUhHUM=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=GZI+KIIMKdrldmwo7anW9rvr4aLsQBZAC9pHRgRsTbVfoUDi8BU6ovBSAJYDNojJh
	 4AYAUZonScKOOogC43EkXDdgB04ocA8/I5WdYaWRnXC8I6s6hlfcjVZrZOmk0glcjQ
	 iPgk0U6tK4L20VCTNJbufSlESIsU620vyTVv/beEcIAlqx1m/rD8o2RM228EyXbNiZ
	 SDBQgev8wOx9x0nh0FR1geOg+/5LPLtX1dOYq7Sevx09h/yPEn8K5XoCwW9UwIVKHl
	 fuKOEaTs33EyjO4TMdIoTR0BvTGHRMJrgHgQ1rHBQT/rIyqGZzr+qbMfvwOcuHZHyT
	 GmcaQve3a1qGg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 19 Dec 2025 13:15:04 +0100
Message-Id: <DF26ONGZ03KH.31FVI22UBGJFX@kernel.org>
Subject: Re: [PATCH 1/4] drm/gpuvm: take GEM lock inside
 drm_gpuvm_bo_obtain_prealloc()
To: "Alice Ryhl" <aliceryhl@google.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20251128-gpuvm-rust-v1-0-ebf66bf234e0@google.com>
 <20251128-gpuvm-rust-v1-1-ebf66bf234e0@google.com>
In-Reply-To: <20251128-gpuvm-rust-v1-1-ebf66bf234e0@google.com>
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: implicit-dest
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 max-recipients; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: MRMXRKE5UJXGQ7AO4BV6SUTR4S345WXD
X-Message-ID-Hash: MRMXRKE5UJXGQ7AO4BV6SUTR4S345WXD
X-Mailman-Approved-At: Fri, 19 Dec 2025 15:52:12 +0000
CC: Daniel Almeida <daniel.almeida@collabora.com>,
 Matthew Brost <matthew.brost@intel.com>,
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
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/MRMXRKE5UJXGQ7AO4BV6SUTR4S345WXD/>
Archived-At: 
 <https://lore.freedesktop.org/DF26ONGZ03KH.31FVI22UBGJFX@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Fri Nov 28, 2025 at 3:14 PM CET, Alice Ryhl wrote:
> +static void
> +drm_gpuvm_bo_destroy_not_in_lists(struct drm_gpuvm_bo *vm_bo)
> +{
> +	struct drm_gpuvm *gpuvm =3D vm_bo->vm;
> +	const struct drm_gpuvm_ops *ops =3D gpuvm->ops;
> +	struct drm_gem_object *obj =3D vm_bo->obj;
> +
> +	if (ops && ops->vm_bo_free)
> +		ops->vm_bo_free(vm_bo);
> +	else
> +		kfree(vm_bo);
> +
> +	drm_gpuvm_put(gpuvm);
> +	drm_gem_object_put(obj);
> +}

I think to us it seems obvious, but I think for new people it might not be.=
 Can
you please add a comment that mentions that this is about the evict and ext=
obj
lists and explains how this is related to locking?
