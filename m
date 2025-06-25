Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72754AE8C30
	for <lists+nouveau@lfdr.de>; Wed, 25 Jun 2025 20:20:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43DBC10E053;
	Wed, 25 Jun 2025 18:20:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZUPN5tOr";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3109510E053
 for <nouveau@lists.freedesktop.org>; Wed, 25 Jun 2025 18:20:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 57DFAA52D49;
 Wed, 25 Jun 2025 18:20:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9D3EC4CEEA;
 Wed, 25 Jun 2025 18:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750875620;
 bh=VxlmLzMyNV7tHN6TJqRWcZDGSM22FRYtG3OjfMQ6e44=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ZUPN5tOreQIycJeduVlWcP1WcvUiGZkIXmffaSYRTlWGdHS6EEP1vDvaTuV0s1afL
 Fu/27kdJL0Cf6ZcytxFFlSrTSyOinOoVQ1el9Wfkw2LuxS2FF55WeENuz4IxxSG+Tk
 BU/gyQbefa3UTkNoN3+0sYtcT4+kSCbE2H9p+X1aOkWzGiAboZlg+1sCbZeJjR1zNy
 THaIYj3LEReChCTb6wqLfY4U6jF6kIrNJVvtHisnIAkssQQdqAVKAkdZxtyaBA9tms
 LndNKlzlVo4zYOytXLoiyjWhyaobTn4p+0LduOVhMLYSjp7D6JbTv1fwYuvkFHFL4w
 caB6muGJXND0w==
Message-ID: <513ee881-cf28-4c68-99ee-5a802c3269e2@kernel.org>
Date: Wed, 25 Jun 2025 20:20:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: Add Alexandre Courbot as co-maintainer to
 nova-core
To: acourbot@nvidia.com
Cc: nouveau@lists.freedesktop.org, airlied@gmail.com, simona@ffwll.ch,
 jhubbard@nvidia.com, bskeggs@nvidia.com, joelagnelf@nvidia.com,
 ttabi@nvidia.com, apopple@nvidia.com, sbaskaran@nvidia.com,
 rust-for-linux@vger.kernel.org, ojeda@kernel.org
References: <20250624170517.105148-1-dakr@kernel.org>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20250624170517.105148-1-dakr@kernel.org>
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

On 6/24/25 7:05 PM, Danilo Krummrich wrote:
> Alex has extensive experience with NVIDIA GPU support, is closely
> involved in nova-core development, and brings valuable Rust expertise.
> 
> In addition to his technical contributions, Alex is actively engaged with
> the broader community. He works closely with contributors and
> stakeholders to identify and solve issues, fosters collaboration, and
> helps ensure that the Nova driver evolves in alignment with the
> community.
> 
> I trust him to take a key role in making the Nova driver a successful
> upstream solution for NVIDIA GPUs in the Linux kernel.
> 
> Cc: Alexandre Courbot <acourbot@nvidia.com>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Applied to nova-next, thanks!
