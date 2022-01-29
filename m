Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 732954A2D25
	for <lists+nouveau@lfdr.de>; Sat, 29 Jan 2022 09:32:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FE2F10F966;
	Sat, 29 Jan 2022 08:32:33 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C916410F966;
 Sat, 29 Jan 2022 08:32:32 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id D279ACE009A;
 Sat, 29 Jan 2022 08:24:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B513DC340E5;
 Sat, 29 Jan 2022 08:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1643444653;
 bh=5/jUt8ZFuRMy8Nor9Tbm4UlQ71QvAjZvWIkQVMS0w+I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jV+GPyQ/QnCVacCVf10kLM2EN1ewkqhgONba2tC6mSynzPXeibT4qxfg3p1QS7BS2
 tjQLiTycRMSfcyZiaH692Vu6zfsbIqWJBdL+aKkveGlAy5iuJ8vg+ktCGYp3Hykkm4
 JVCc4Z9VrPjPugzyDhwU+5xubCVpDUwr2V1bCUow=
Date: Sat, 29 Jan 2022 09:24:05 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Lyude Paul <lyude@redhat.com>
Message-ID: <YfT5pf5hGwhnE+AK@kroah.com>
References: <20220124165856.57022-1-zhou1615@umn.edu>
 <YfPC3N+H9Fu/gqpz@kroah.com>
 <536c833413ccbe0b8ad653a50c5ea867bf975290.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <536c833413ccbe0b8ad653a50c5ea867bf975290.camel@redhat.com>
Subject: Re: [Nouveau] [PATCH] drm/nouveau/acr: Fix undefined behavior in
 nvkm_acr_hsfw_load_bl()
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 kjlu@umn.edu, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 Zhou Qingyang <zhou1615@umn.edu>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Fri, Jan 28, 2022 at 02:20:24PM -0500, Lyude Paul wrote:
> Sigh-thank you for catching this - I had totally forgot about the umn.edu ban.
> I pushed this already but I will go ahead and send a revert for this patch.

No worries, thanks for doing this.

greg k-h
