Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A139A20F8
	for <lists+nouveau@lfdr.de>; Thu, 17 Oct 2024 13:32:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30D2A10E7F1;
	Thu, 17 Oct 2024 11:32:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="NQ8F11an";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CBF310E7F1
 for <nouveau@lists.freedesktop.org>; Thu, 17 Oct 2024 11:32:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 03D4C5C610A;
 Thu, 17 Oct 2024 11:32:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D5C6C4CEC5;
 Thu, 17 Oct 2024 11:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1729164736;
 bh=+x1CGAgYUGQhLPtP/ssxqmj1tTL8BqysxgsjWUS0PqU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NQ8F11an+8cIrI7iZVURy+g17MTjudyFtF/P6Kljd5xoyvE6cVrZwpirYffB1cNYC
 aIIAYFGz7BlJdO24hjFf/TiZlTh0cv8wJH22Sp3jAlK30El2ydhXk8VyUO0hiUpMYL
 eCid9bWGgOrMtQ7Yru8hLlhysQXCq+Vx27iXFIhY=
Date: Thu, 17 Oct 2024 13:32:13 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Zhi Wang <zhiw@nvidia.com>
Cc: nouveau@lists.freedesktop.org, airlied@gmail.com, daniel@ffwll.ch,
 dakr@kernel.org, bskeggs@nvidia.com, acurrid@nvidia.com,
 cjia@nvidia.com, smitra@nvidia.com, ankita@nvidia.com,
 aniketa@nvidia.com, kwankhede@nvidia.com, targupta@nvidia.com,
 zhiwang@kernel.org
Subject: Re: [PATCH] drm/nouveau/nvkm: refine the device SKU enum
Message-ID: <2024101756-carving-registry-40ec@gregkh>
References: <20241017112454.2524588-1-zhiw@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241017112454.2524588-1-zhiw@nvidia.com>
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

On Thu, Oct 17, 2024 at 04:24:54AM -0700, Zhi Wang wrote:
> NVKM uses a enum called "card_type" to represent the device SKU in the
> code. Within the enum, each device SKU is represent like NV_10, AD100, etc.
> 
> Many concerns were raised due to over-short SKU enums can conflicts with
> other local enums and a prefix is also required as an identifier of
> namespace of a driver.
> 
> Rename enum "card_type" to "sku". Add the prefix NVKM_DEVICE_ before each
> device SKU inside the enum and some other coding format tweaks to make
> checkpatch.pl happy.
> 
> No functional change is intended.
> 
> Signed-off-by: Zhi Wang <zhiw@nvidia.com>

Nice, thanks for doing this.

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
