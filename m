Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA5EA3114C5
	for <lists+nouveau@lfdr.de>; Fri,  5 Feb 2021 23:16:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 941476E0B6;
	Fri,  5 Feb 2021 22:16:03 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-40131.protonmail.ch (mail-40131.protonmail.ch
 [185.70.40.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71B3C6E0B6
 for <nouveau@lists.freedesktop.org>; Fri,  5 Feb 2021 22:16:02 +0000 (UTC)
Date: Fri, 05 Feb 2021 22:15:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1612563360;
 bh=SS4/ql4GvgG8vctstgI6CjCqx5zDsqIojvlE8p6HkVE=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=lCdOsVBnsZasdiEBjSmYgwlQefZwYrF9HTeEdXcVuuQ6YtXERK1Bb0V9gG9DfDSkh
 y3WSdf7pfyfekhUBXAA2bNJNKCO47RbeP6HhvdPLrzx2BZUN4cLeVTkA26OtQS1xO5
 ROooACvBuwe98OtkRDior8yGK/8nN1TcRU+sbKTk4IZtN/Ui4LylgHhePZC56QQoGY
 za/B4PbfhQlc7nduGfyORezr7ubU/hb9fzLZl921Qfk0nN1mdb76vqswZrUwlee6iV
 JaFAtxCfVPays4/d6lVt+igDlLDTNq62AAZscQK7dStz7HG6e9aJSGr0dyc3t+rSsD
 n/P4hdxdrNenw==
To: Ilia Mirkin <imirkin@alum.mit.edu>
From: Simon Ser <contact@emersion.fr>
Message-ID: <OwU6EvrH4NXy5d3uyiItz2FdTvtka7lhHUtqCVeKDgJ43bGec9ELDkDMGnHPJw3bemv9am9efVyQpjssB_NLMSParby2Z5kbc1QENlSL0tI=@emersion.fr>
In-Reply-To: <CAKb7Uvj3HLGMiO4uxvjmR7JCdEN_4b3K46tQeqxtCOYw2AZ1uw@mail.gmail.com>
References: <20210205210044.2665-1-contact@emersion.fr>
 <CAKb7Uvj3HLGMiO4uxvjmR7JCdEN_4b3K46tQeqxtCOYw2AZ1uw@mail.gmail.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
Subject: Re: [Nouveau] [PATCH v2] nouveau/dispnv50: add cursor pitch check
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: nouveau <nouveau@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Friday, February 5th, 2021 at 10:50 PM, Ilia Mirkin <imirkin@alum.mit.edu> wrote:

> > return head->func->curs_format(head, asyw, asyh);
>
> While you're at it, maybe give this one some love too?

Sure, although this would be a driver bug because DRM core already
checks the format. curs_format has WARN_ON when it fails.
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
