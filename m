Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B3ABC43AF
	for <lists+nouveau@lfdr.de>; Wed, 08 Oct 2025 11:58:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E554410E0FC;
	Wed,  8 Oct 2025 09:57:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="uI+2DHzf";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D601E10E0E3;
 Wed,  8 Oct 2025 09:57:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 8C2E443BDB;
 Wed,  8 Oct 2025 09:57:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5609AC4CEF4;
 Wed,  8 Oct 2025 09:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759917477;
 bh=Du3rFNkYwgdmoyPLOqFQnUZ5XJn5oBWCLYwxql0rNy4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=uI+2DHzfiIT9dzxXoL7i0x/pAqr3Hm56UvCtm9CIGaJyBeOuCp8UyfQhf1Rnkw8Xx
 r0EZqPc4SXsX4NBElq4VUMU3hloHiNMxDq3REjaQX5+jl1Ar3afIQeoTvyTjHm/Saf
 ZdtN8gwZeP8QXyr5ChZFDAIUAx3+55fiMGEhv58WXLrf0hyyFUOvcwrgCShSFeKEP+
 3CoEYBzKrjf0O/9NMBp2laBqWE1t1fmzkGduIAQOWyFtKri34JL8NZA3DwOQ1QH2Aq
 ofZLJHsIhhTZ4CGqOLo7fR9+i9yqKVXvCJSyrXYKGtgusalmKJeD4PGgg9rjJlOzDg
 wgUvmVS57yHHg==
Message-ID: <1f26173d-6d02-4445-8a78-c8464a57c450@kernel.org>
Date: Wed, 8 Oct 2025 11:57:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/client: Remove holds_console_lock parameter from
 suspend/resume
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: alexander.deucher@amd.com, christian.koenig@amd.com,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tursulin@ursulin.net, lyude@redhat.com,
 lucas.demarchi@intel.com, thomas.hellstrom@linux.intel.com,
 jfalempe@redhat.com, javierm@redhat.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, intel-xe@lists.freedesktop.org
References: <20251001143709.419736-1-tzimmermann@suse.de>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20251001143709.419736-1-tzimmermann@suse.de>
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

On 10/1/25 4:37 PM, Thomas Zimmermann wrote:
> No caller of the client resume/suspend helpers holds the console
> lock. The last such cases were removed from radeon in the patch
> series at [1]. Now remove the related parameter and the TODO items.
> 
> v2:
> - update placeholders for CONFIG_DRM_CLIENT=n
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Link: https://patchwork.freedesktop.org/series/151624/ # [1]
Acked-by: Danilo Krummrich <dakr@kernel.org>
