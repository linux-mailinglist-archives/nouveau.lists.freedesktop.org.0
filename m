Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B345C6F9CF8
	for <lists+nouveau@lfdr.de>; Mon,  8 May 2023 02:32:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16AB010E08E;
	Mon,  8 May 2023 00:32:33 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail1.merlins.org (magic.merlins.org [209.81.13.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4229F10E04E
 for <nouveau@lists.freedesktop.org>; Mon,  8 May 2023 00:32:30 +0000 (UTC)
Received: from svh-gw.merlins.org ([76.132.34.178]:50512
 helo=sauron.svh.merlins.org) by mail1.merlins.org with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim
 4.94.2 #2)
 id 1pvnrK-0007yd-9C by authid <merlins.org> with srv_auth_plain;
 Sun, 07 May 2023 17:32:26 -0700
Received: from merlin by sauron.svh.merlins.org with local (Exim 4.92)
 (envelope-from <marc_nouveau@merlins.org>)
 id 1pvoni-000nlL-4r; Sun, 07 May 2023 17:32:26 -0700
Date: Sun, 7 May 2023 17:32:26 -0700
From: Marc MERLIN <marc_nouveau@merlins.org>
To: Steven Kucharzyk <stvr_8888@comcast.net>
Message-ID: <20230508003226.GE3737138@merlins.org>
References: <20230504233216.GJ1191678@merlins.org>
 <20230504224321.2b8b2f54@n2pa> <20230505041111.GS13387@merlins.org>
 <20230505135650.1be375cf@n2pa>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230505135650.1be375cf@n2pa>
X-Sysadmin: BOFH
X-URL: http://marc.merlins.org/
X-SA-Exim-Connect-IP: 76.132.34.178
X-SA-Exim-Mail-From: marc_nouveau@merlins.org
Subject: Re: [Nouveau] 6.2 still cannot get hdmi display out on Thinkpad P73
 Quadro RTX 4000 Mobile/TU104
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
Cc: nouveau@lists.freedesktop.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Fri, May 05, 2023 at 01:56:50PM -0500, Steven Kucharzyk wrote:
> Nvidia does great support (on-line chat) don't remember if you need to
> sign-up for free account or not but I say first hand that your talking
> with an engineer who will answer *any* type question. I've been buying
> Nvidia for twenty yrs. or more and have actually been to the site.
> They're very customer centric, so much so that on saturdays they (did)
> would give kids the opportunity to come in and play with experimental
> setups. Even with Nouveau running you're going to need some parts of their
> drivers. 
 
From what I understand, nvidia supports their out of tree binary
drivers. I'm not really interested in using them for a variety of
reasons including the fact that I have no use for the chip on my laptop
(I was forced to buy it) and I only need to power on the chip when I do
HDMI or DP out.
I know the nouveau driver isn't as good, but I only need it to do basic
mirror display and power management (turn the chip off when I don't use
it).
It manages to do this on my P70, but not my P73 yet.

At this point I'm still trying to get confirmation of whether nouveau is
supposed to work on my chip, or not yet, but it's been 2 years since my
first post since I got this new laptop (then) and no luck yet.

Marc
-- 
"A mouse is a device used to point at the xterm you want to type in" - A.S.R.
 
Home page: http://marc.merlins.org/                       | PGP 7F55D5F27AAF9D08
