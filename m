Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 310E86F6BCD
	for <lists+nouveau@lfdr.de>; Thu,  4 May 2023 14:33:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B124110E4AB;
	Thu,  4 May 2023 12:32:58 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F71210ECC6;
 Fri, 28 Apr 2023 10:18:20 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 265436602097;
 Fri, 28 Apr 2023 11:18:17 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1682677097;
 bh=Yk5D9b+oPUkoCZwzeMIIJtHOgvXide7fZoW+I8ghpV0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=mhhECMNxkLs1iW+QaB2pRm8nUySryOtAT9Y4NOyMqr2EqHYzZmpOT+adaU6/ID1a9
 no1OdnK+ALZIj8/C7cBWw20X2bNzE89ZFuf6mYMbos909zeCh8D7m0E2UFsLyi3fri
 MJloqfSnhMn9R9NfMh89i03ukNYFMrsV08bymj3SSPhXtXvaNygxNTThFredKI91aT
 E3NP3647tgYI23H9PtLyuLvhEXAJoK4jHGAjfi09ZqIlAzfKWTKK6G/5bZj9bKGvUX
 sM8uGnfSD66AngdfS1WteFdbKzplq4xmhjx4GPFm5NVhHHnboQ0n6DZdSmsdshX2G0
 mCGmVSSVOfJmw==
Date: Fri, 28 Apr 2023 12:18:13 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Danilo Krummrich <dakr@redhat.com>
Message-ID: <20230428121813.309ea609@collabora.com>
In-Reply-To: <20230404012741.116502-5-dakr@redhat.com>
References: <20230404012741.116502-1-dakr@redhat.com>
 <20230404012741.116502-5-dakr@redhat.com>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 04 May 2023 12:31:34 +0000
Subject: Re: [Nouveau] [PATCH drm-next v3 04/15] drm: manager to keep track
 of GPUs VA mappings
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
Cc: matthew.brost@intel.com, willy@infradead.org, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, corbet@lwn.net, nouveau@lists.freedesktop.org,
 ogabbay@kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 mripard@kernel.org, linux-mm@kvack.org, alexdeucher@gmail.com,
 bskeggs@redhat.com, Liam.Howlett@oracle.com, Dave Airlie <airlied@redhat.com>,
 bagasdotme@gmail.com, christian.koenig@amd.com, jason@jlekstrand.net
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Tue,  4 Apr 2023 03:27:30 +0200
Danilo Krummrich <dakr@redhat.com> wrote:

> +struct drm_gpuva_manager {
> +	/**
> +	 * @name: the name of the DRM GPU VA space
> +	 */
> +	const char *name;
> +
> +	/**
> +	 * @mm_start: start of the VA space
> +	 */
> +	u64 mm_start;
> +
> +	/**
> +	 * @mm_range: length of the VA space
> +	 */
> +	u64 mm_range;
> +
> +	/**
> +	 * @mtree: the &maple_tree to track GPU VA mappings
> +	 */
> +	struct maple_tree mtree;
> +
> +	/**
> +	 * @kernel_alloc_node:
> +	 *
> +	 * &drm_gpuva representing the address space cutout reserved for
> +	 * the kernel
> +	 */
> +	struct drm_gpuva kernel_alloc_node;
> +
> +	/**
> +	 * @ops: &drm_gpuva_fn_ops providing the split/merge steps to drivers
> +	 */
> +	struct drm_gpuva_fn_ops *ops;

Any reason for not making that a const object (same goes for all the
functions being passed a drm_gpuva_fn_ops)?

> +};
