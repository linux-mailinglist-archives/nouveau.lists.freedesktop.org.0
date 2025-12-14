Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B50CBB64B
	for <lists+nouveau@lfdr.de>; Sun, 14 Dec 2025 04:04:34 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id BCFBF10E153;
	Sun, 14 Dec 2025 03:04:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=efault@gmx.de header.b="a5zC6PKq";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id AA390452DC;
	Sun, 14 Dec 2025 02:57:10 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1765681030;
 b=mgm3E553tjsPGBSqDbhW4oZVIEvSMD1ASZKh+VA82y0S/VfzS4xTNc9Q89VWlZ5A1PVom
 sjkiKgsDzk51n1jOXYB9eF0K6wa0ieW9IS/VhjCgLG28Vshbx+vdpIQl8ytaMVkVSF7zpFf
 NRZjEiBT/9iKlz31qt0GtaU/tU4YolZZma+VxFW7z/dD/BoGztno5W8ftRivPmfJjh2+Hjv
 cKhSsTAfC+mkQQvPEkDfk5z+BlBmXq2z6YRvuTBy/eWArjgB0GdlT6ffV7jVnXst3YaTPyl
 +yjVNuZDTLXVcIog4eHzvWYL++O1IuY2bQXiTjyEygBllqUqR+IAsJ8flG9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1765681030; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=Lwx2EivwSLpwXjcsPutGlRJl/zomSpgh+pmX/1x1bW0=;
 b=YYEEKD8jPb74FNIrPKUGfGMS9uwgUTgQ8BCUMjYpfIkMw3R0HE41DUl+yj4cwZL9BU5e/
 jvF3v5BK5HKWe3LyV5V46EfEcoObOvXSQm1WdtKyvd4Z9T12Y7qMbnq+DU09rsPYHgJ2rwy
 CdPe3W4RH3U3q8AxPqJBaaE6sdHzUy/NsVjdiRXnTgjDzhmZ2bZi3rGXXX/qHBMKUGwXJxn
 9GjxbZWA8If3q8GC1UoRzJoNA8O7I5LlitgiOKBYoDikgp160RpkhS5bPSgbQn86lh5FuAn
 b3boMiabqIjiB4w/fwu0jjErqROrO9jf1fT+XNd7qHoX4Xxn3uoG9voCWtsA==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=gmx.de header.i=efault@gmx.de;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=gmx.de
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org;
 dkim=pass header.d=gmx.de header.i=efault@gmx.de;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=gmx.de
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id C015F452D8
	for <nouveau@lists.freedesktop.org>; Sun, 14 Dec 2025 02:57:07 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0F48510E01F
	for <nouveau@lists.freedesktop.org>; Sun, 14 Dec 2025 03:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1765681462; x=1766286262; i=efault@gmx.de;
	bh=Lwx2EivwSLpwXjcsPutGlRJl/zomSpgh+pmX/1x1bW0=;
	h=X-UI-Sender-Class:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:MIME-Version:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=a5zC6PKqYQ3rNk+aBkA8SbOUVNovvab4ERq6EUSqSPop9ViEVnZtg22R5lm00GxV
	 5/YttuzL7ubk2w6+EGBYMYY7oziQgUu8M2U2dh1hJb2368aD6Zqyg9qeriNfg+F14
	 0pjoTKF8DgRzIrAubnvE4RJjZ9Lw59KqQiS5XUyek0UkgivL5qHcGVKtYi5dHlcYY
	 JEEARQgKD892KME93+Ez2iMgOnDMvPRPwq+4aA4Qw/qSpv8aTFeMwDQDaX+bxNAt+
	 tDzVcszpxZ1U5xy6mimIBv6ZjAF26KBz9aTi98vHu1IUmBqdllE5It9vNqgfthtgS
	 7gBrfRTHMwcPYMeA0Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from homer.fritz.box ([185.146.50.121]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MPXhA-1vhM873iNe-00YgGB; Sun, 14
 Dec 2025 04:04:21 +0100
Message-ID: <14d49f3096a7c9a7baa8a5ed0f6366de15ae491d.camel@gmx.de>
Subject: Re: nouveau: endless drm_WARN_ON(state->checked) spew beginning at
 6.19 merge window
From: Mike Galbraith <efault@gmx.de>
To: lyude@redhat.com, lkml <linux-kernel@vger.kernel.org>
Date: Sun, 14 Dec 2025 04:04:20 +0100
In-Reply-To: <282972afc7d20facacedc0a81810daff1bbaa885.camel@redhat.com>
References: <1515cc8a9fcb4abbf86c88ce99ff8900ec19f499.camel@gmx.de>
		 <dbd16cb10f0b3d7747491796e41305ed0cea5a3b.camel@gmx.de>
	 <282972afc7d20facacedc0a81810daff1bbaa885.camel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 
MIME-Version: 1.0
X-Provags-ID: V03:K1:ypp/s5jFLiA8kXliQUBmkBm3GpRCsn6ZPjo5b7CSMKcdcC0ck/Z
 j13M3Y3JKDKYZe8bLrqj8G+0Pa9Xku+azklJXskcbdYWUNCJqVm5NglfZ1KbGg9lVxlfNCp
 Mb08VdDOtEW2KfjSKCD+BnEu68/LHLxLMt0gimymXuTHrhtqSknn6At4AdXTADxSMY6OCda
 FP13kRaXy2HPsEWwDLljA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:dihg6HCadvY=;quX0LkWKvKeLmHQ1mGsHndgUnW4
 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
 4YnHluxELgwGCAy5I=
Message-ID-Hash: 6HXP2FGJ7ZXC6VI6CK6TEXNBTNOYHSTI
X-Message-ID-Hash: 6HXP2FGJ7ZXC6VI6CK6TEXNBTNOYHSTI
X-MailFrom: efault@gmx.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Danilo Krummrich <dakr@kernel.org>,
 nouveau <nouveau@lists.freedesktop.org>,
 Ville =?ISO-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/6HXP2FGJ7ZXC6VI6CK6TEXNBTNOYHSTI/>
Archived-At: 
 <https://lore.freedesktop.org/14d49f3096a7c9a7baa8a5ed0f6366de15ae491d.camel@gmx.de/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Thu, 2025-12-11 at 13:07 -0500, lyude@redhat.com wrote:
> Yep - I'm going to be sending out a respin of the patch that fixes this
> issue today

Yup, all better.

	-Mike
