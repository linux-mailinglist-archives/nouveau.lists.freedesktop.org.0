Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D41AFB69F
	for <lists+nouveau@lfdr.de>; Mon,  7 Jul 2025 16:59:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39B2F10E4BF;
	Mon,  7 Jul 2025 14:59:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XZJxnmgu";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59A4710E4BF
 for <nouveau@lists.freedesktop.org>; Mon,  7 Jul 2025 14:59:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2B1975C5522;
 Mon,  7 Jul 2025 14:59:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54F5AC4CEE3;
 Mon,  7 Jul 2025 14:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751900367;
 bh=82vKcV9kj061NhdvglUDngTJmHkctFYXHaPT/k5WV/0=;
 h=Date:Subject:To:References:From:Cc:In-Reply-To:From;
 b=XZJxnmgunUyCxYRpNv8wDNrYxcFp0IFQcmEVXRB+QzWOybG108gP//vvcwmW7Ghmc
 KYuDesGj+YyG6t+0bDUTlgVtCd/ybxiiBG2wQY1n36mWIPxtb1hbYqUOqLrMkkNxU6
 MDHWXByadYlqxcXjlxx57c0rm1z6hJU3OPh/hUoPN3AaaPOyB1EeFsvW1nZHoWH6QI
 2uitwCTGXM6PcaQWsDQk2Jq6/DkpXesyLGbDbmZ4s7L1mUNXwrWQSLZAgGNijlC0u6
 pil+WZ10yu13uOOTkinwrN0CKshT422Ja3ckFBg1XeYmwrtgywbyAwBIrEBFxsCiRX
 i6eislMlNi/Yg==
Message-ID: <6fc2a148-8c9e-4b6c-aed0-5f2bee1bd9eb@kernel.org>
Date: Mon, 7 Jul 2025 16:59:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/nouveau/gsp: fix potential leak of memory used during
 acpi init
To: Ben Skeggs <bskeggs@nvidia.com>
References: <20250617040036.2932-1-bskeggs@nvidia.com>
From: Danilo Krummrich <dakr@kernel.org>
Cc: nouveau@lists.freedesktop.org
Content-Language: en-US
In-Reply-To: <20250617040036.2932-1-bskeggs@nvidia.com>
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

On 6/17/25 6:00 AM, Ben Skeggs wrote:
> If any of the ACPI calls fail, memory allocated for the input buffer
> would be leaked.  Fix failure paths to free allocated memory.
> 
> Also add checks to ensure the allocations succeeded in the first place.
> 
> Reported-by: Danilo Krummrich <dakr@kernel.org>
> Fixes: 176fdcbddfd2 ("drm/nouveau/gsp/r535: add support for booting GSP-RM")
> Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>

Applied to drm-misc-fixes, thanks!
