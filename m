Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21ED9BBF38A
	for <lists+nouveau@lfdr.de>; Mon, 06 Oct 2025 22:39:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BBD010E466;
	Mon,  6 Oct 2025 20:39:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bfFJxe4m";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F38810E466;
 Mon,  6 Oct 2025 20:39:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 451C9440CA;
 Mon,  6 Oct 2025 20:39:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 438CEC4CEF5;
 Mon,  6 Oct 2025 20:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759783142;
 bh=1F3yR8HVkURa8WwisEPfn7+RUwEt2ebKWI3pRZ5T+jU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=bfFJxe4mu4iYY9tJpNihCb5imFngU0VWbkIBwccbaAym15CAP7WKw6wDFRv8AZbi1
 NGFtw+wLB+yDIdUQb0vZJZIncxwdElVH+t+n7MLuH3u4j/jyA1EOOsJE6M/A5SgGPg
 F+ttGB83uYrDkbag3M1lgC2Hbwc2fstoipQVhGAVl/RB6zPFBdKCEfaVj8zk2AMhLJ
 wmSrQ7pNdeYJY98LMxvXvAPGozYmK/G7vdr968PDp33HddO+ksWCkmxxZPJ/UqKnuO
 aYD1Ar4iJrgxMZC9n7Up7Aw/2KMmQcfqFTAj6ssIBS9W9xCcs4UgJGBsQWQQFXfsqM
 gpS6XziN4LOVA==
Message-ID: <fd9d9eb4-c870-4f02-a399-ace58fc1f16f@kernel.org>
Date: Mon, 6 Oct 2025 22:38:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/nouveau: Fix refcount leak in nouveau_connector_detect
To: Shuhao Fu <sfual@cse.ust.hk>
Cc: Lyude Paul <lyude@redhat.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
References: <aOPy5aCiRTqb9kjR@homelab>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <aOPy5aCiRTqb9kjR@homelab>
Content-Type: text/plain; charset=UTF-8
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

On 10/6/25 6:48 PM, Shuhao Fu wrote:
> A possible inconsistent refcount update has been identified in function
> `nouveau_connector_detect`, which may cause a resource leak.
> 
> After calling `pm_runtime_get_*(dev->dev)`, the usage counter of `dev->dev`
> gets increased. In case function `nvif_outp_edid_get` returns negative,
> function `nouveau_connector_detect` returns without decreasing the usage
> counter of `dev->dev`, causing a refcount inconsistency.
> 
> Signed-off-by: Shuhao Fu <sfual@cse.ust.hk>
> Closes: https://gitlab.freedesktop.org/drm/nouveau/-/issues/450
Can you please add a corresponding Fixes: tag and Cc: the stable list?
