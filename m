Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E775ACBABC5
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:43:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 570D210EA83;
	Sat, 13 Dec 2025 12:41:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="ITk6BOtc";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBA3E10FEF5
 for <nouveau@lists.freedesktop.org>; Mon, 29 Apr 2024 14:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1714400773;
 bh=slHOPe8jumqMyPrbEkabd/KOXeLrHQy6m2PFlXtS1gE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ITk6BOtc8lsKtQPwe8KkoZ5EhEOgMC2HMQWJNzmgMuIzX3tQhBGSAEx1gf3Ng84n3
 Vah1A23RtS32EjnewhYCc+zOY4DjQmOO/imusAy/s8hK2zWqRIVquWWgXlsCFR7Uxp
 i9ofVs6jvf5iPNwjXlV3WvG2to2UZROdyBEMb21Z51Nytceuew3Jz7Ckt7RCcU5JV4
 hk+wdrrEONFxKhi8JL5I5smFvY6tCYcdPJRV0DLeZiIY9ocQlstUDCLgTJh0v6IQuz
 B1PrzARq4JVohnBqZw4KfPz+Ozt+W4Vy17zsRCUcGa5wYtgsk415NeVfoT1bKdNATe
 CNn5PJ2q3WT2w==
Received: from notapiano (zone.collabora.co.uk [167.235.23.81])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: nfraprado)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 647B93780BFE;
 Mon, 29 Apr 2024 14:26:11 +0000 (UTC)
Date: Mon, 29 Apr 2024 10:26:09 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Timur Tabi <ttabi@nvidia.com>
Cc: "airlied@redhat.com" <airlied@redhat.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "lyude@redhat.com" <lyude@redhat.com>, Ben Skeggs <bskeggs@nvidia.com>,
 "dakr@redhat.com" <dakr@redhat.com>,
 "danishanwar@ti.com" <danishanwar@ti.com>, regressions@lists.linux.dev
Subject: Re: [PATCH] [v7] nouveau: add command-line GSP-RM registry support
Message-ID: <585237c9-2bfb-46bc-84ef-0de78e917ddc@notapiano>
References: <20240417215317.3490856-1-ttabi@nvidia.com>
 <c5ff8d3e-ecfc-4970-86c0-540b75b4be2e@ti.com>
 <2775775499487396fbad5c2327dcaf7fb88a524d.camel@nvidia.com>
 <c5d25e0f-046e-4c8b-b89e-de784f489441@notapiano>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c5d25e0f-046e-4c8b-b89e-de784f489441@notapiano>
X-Mailman-Approved-At: Sat, 13 Dec 2025 12:40:43 +0000
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

On Mon, Apr 29, 2024 at 10:15:41AM -0400, Nícolas F. R. A. Prado wrote:
> On Mon, Apr 29, 2024 at 12:40:25PM +0000, Timur Tabi wrote:
> > On Mon, 2024-04-29 at 14:49 +0530, MD Danish Anwar wrote:
[..]
> 
> #regzbot introduced: b58a0bc904ffa
> #regzbot title: arm64 build failure with error 'label at end of compound statement' on next-20240429

Sorry for the extra noise, I forgot to CC this to the regressions list... Doing
it now.

#regzbot introduced: b58a0bc904ffa ^
#regzbot title: arm64 build failure with error 'label at end of compound statement' on next-20240429

Thanks,
Nícolas
