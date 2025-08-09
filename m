Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D34B1F454
	for <lists+nouveau@lfdr.de>; Sat,  9 Aug 2025 13:12:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1C2910E0C1;
	Sat,  9 Aug 2025 11:12:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IJ0hYbC8";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9B5F10E0C1
 for <nouveau@lists.freedesktop.org>; Sat,  9 Aug 2025 11:12:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2E59743457;
 Sat,  9 Aug 2025 11:12:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F41BC4CEE7;
 Sat,  9 Aug 2025 11:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754737962;
 bh=YFmZ1Ri5PLB2IsbJtl5LTB7X6D3b7BvXQeMxUA8lV1c=;
 h=Date:Subject:To:References:From:Cc:In-Reply-To:From;
 b=IJ0hYbC8v3JQEpC8Am5qdWoAzzIeauRbHZFLX1KmIXzLIlDDfZTj280GQP7UA0kRL
 kYhD47N22wR7nRb1xH0kP6AeDZgzwhCOgiTmwqP8eukznQ6Ero5DckvVseROQ8fCdX
 DfI6mZT9JnFU/rYCi6s9P18SHQl+EKTAZTLeeDiv3uL10DZYJjl9I1FFSLCZiC7qzP
 bM86u9lBjqYXIRhqeVUFaafnM3qDqwKCrazCHMlX1QoveXcNISk5hGuMXvM3cmkduW
 ffaZ9wEXDXZhFKrM6xhhTN6bE8rgZGePqlOlQqjvmmi0MpD9Bnx83iK7UdPF+kf2VH
 IDXOf4Txp/vtA==
Message-ID: <d35654eb-6aee-4b5d-88af-32bfe4eb6b5c@kernel.org>
Date: Sat, 9 Aug 2025 13:12:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/nouveau: always set RMDevidCheckIgnore for GSP-RM
To: Timur Tabi <ttabi@nvidia.com>
References: <20250808191340.1701983-1-ttabi@nvidia.com>
From: Danilo Krummrich <dakr@kernel.org>
Cc: Lyude Paul <lyude@redhat.com>, nouveau@lists.freedesktop.org
Content-Language: en-US
In-Reply-To: <20250808191340.1701983-1-ttabi@nvidia.com>
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

On 8/8/25 9:13 PM, Timur Tabi wrote:
> Always set the RMDevidCheckIgnore registry key for GSP-RM so that it
> will continue support newer variants of already supported GPUs.
> 
> GSP-RM maintains an internal list of PCI IDs of GPUs that it supports,
> and checks if the current GPU is on this list.  While the actual GPU
> architecture (as specified in the BOOT_0/BOOT_42 registers) determines
> how to enable the GPU, the PCI ID is used for the product name, e.g.
> "NVIDIA GeForce RTX 5090".
> 
> Unfortunately, if there is no match, GSP-RM will refuse to initialize,
> even if the device is fully supported.  Nouveau will get an error
> return code, but by then it's too late.  This behavior may be corrected
> in a future version of GSP-RM, but that does not help Nouveau today.

Are there any GPUs in the field today which technically are supported, but yet
refused by GSP due to this?

> Fortunately, GSP-RM supports an undocumented registry key that tells it
> to ignore the mismatch.  In such cases, the product name returned will
> be a blank string, but otherwise GSP-RM will continue.

I assume you refer to internal documentation when you say "undocumented"?

> Unlike Nvidia's proprietary driver, Nouveau cannot update to newer
> firmware versions to keep up with every new hardware release.  Instead,
> we can permanently set this registry key, and GSP-RM will continue
> to function the same with known hardware.
