Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AEDC9E47B7
	for <lists+nouveau@lfdr.de>; Wed,  4 Dec 2024 23:20:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38A3F10E59C;
	Wed,  4 Dec 2024 22:20:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XZAo7m8m";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D066810E59C
 for <nouveau@lists.freedesktop.org>; Wed,  4 Dec 2024 22:20:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1AF675C68B7;
 Wed,  4 Dec 2024 22:19:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD0D5C4CECD;
 Wed,  4 Dec 2024 22:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733350823;
 bh=GECUW1zcPqywtdMWXog/qSIekGil/NR9MYAZJMB0SRs=;
 h=Date:Subject:To:References:From:Cc:In-Reply-To:From;
 b=XZAo7m8mKOj4oKzZCiRi3AtIgqc5aCiLOZE+WJe8Q16slMp4BZc9DlJ+dnXNaJbB7
 +AXBLnYlajNfTpONcG876sNjhoGan8BJpVCBNlhWszl0rsMCzyUiAPpSuFNF4Tkfov
 2fX/+KRyYg/AW1tDsGAZzixthCq2xSF4Kn0CrEkWElUjfRsiqnWhzu2wwll1K6oLcp
 HSq+yfQtyWOWWFzHxg3SC3gtKXxbe+z2KqvmjInj0UqSx0Iw1Y4sPQQtzbaXxcuVsm
 uh5PvFpniGKqZobxMVtQ4mExEZQjgsvn+gdB6pvKqEaOOiiI1kfBFLrx897ALCtiGy
 UIsV1IFk+jv1Q==
Message-ID: <cf3c3831-5cc3-40bd-8d20-9635d6120558@kernel.org>
Date: Wed, 4 Dec 2024 23:20:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] [v2] drm/nouveau: retain device pointer in
 nvkm_gsp_mem object
To: Timur Tabi <ttabi@nvidia.com>
References: <20241030202952.694055-1-ttabi@nvidia.com>
From: Danilo Krummrich <dakr@kernel.org>
Cc: bskeggs@nvidia.com, Dave Airlie <airlied@redhat.com>,
 nouveau@lists.freedesktop.org
Content-Language: en-US
In-Reply-To: <20241030202952.694055-1-ttabi@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 10/30/24 9:29 PM, Timur Tabi wrote:
> Store the struct device pointer used to allocate the DMA buffer in
> the nvkm_gsp_mem object.  This allows nvkm_gsp_mem_dtor() to release
> the buffer without needing the nvkm_gsp.  This is needed so that
> we can retain DMA buffers even after the nvkm_gsp object is deleted.
> 
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>

Applied to drm-misc-next, thanks!
