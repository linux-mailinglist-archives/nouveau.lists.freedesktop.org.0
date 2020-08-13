Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F3F2243EF7
	for <lists+nouveau@lfdr.de>; Thu, 13 Aug 2020 20:39:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B916A6EA8C;
	Thu, 13 Aug 2020 18:39:52 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A1E86EA8C
 for <nouveau@lists.freedesktop.org>; Thu, 13 Aug 2020 18:39:51 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id v4so7341283ljd.0
 for <nouveau@lists.freedesktop.org>; Thu, 13 Aug 2020 11:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:user-agent:mime-version
 :content-transfer-encoding:content-disposition:message-id;
 bh=4dbbIi3pBeQjavhhdPwN6ydo/WoTsZpt4JBb2CvbcpM=;
 b=G69cmaxrekNaAp9+vDbtKFUB+5pyOCAUhg4ngQx9ka0hruG7LV4Z58GkJzYeuYvU1Z
 tBeuz884jkhD5klms+pk3cdx3YMzaK1PlMj/KtOEWG7lrAWI0/IJUBeR51f/oFyx4ecD
 GIqLcUsWt2ecRQQF6zGEbtqMCL/ZBMH5VvwNT7Prq80Tgv6NxcwgAew2mAYbaMP7zNgf
 JAK3xnjTxVmQRUT5ZA1oR2BjYG4+pkTOvYrJ7w5gXqM7M91CNRPNrY0i2NnaA2I5+sof
 H/BIi+kHL1bSZGELygnsHPpzSbiMsvWyWDASVF5yAqO86JrTz8GRUdq+Jt22x6VYbtIG
 110w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:user-agent:mime-version
 :content-transfer-encoding:content-disposition:message-id;
 bh=4dbbIi3pBeQjavhhdPwN6ydo/WoTsZpt4JBb2CvbcpM=;
 b=eDZF5J571PzySGfirn3zl8UsGrddhJkK2RVXhP2Z2WDKDb2SWjuOPC/t8Rf8umfMD1
 YPtLVL8Z3qRlio6GALJIp9daK2wWSuwtQ1Q2YJEhPFWD7wA05McQHDYWkulyPm0H8IsB
 k3W6uGQuKb9IMQg6AKEunNRwp3eii+9jRn7vHOYfhDu8tqHSGoQMhU9X7rMVBVX7mvF6
 eSCeSJsVWqfMxkafAY4wcA9TkGj3DkDHt9lQBqFB78SoCxxO8I6FbkTsUexw5M3k0okY
 oQ1KUEBG11XgNtzbKT4RttKdB2TauMLnu5WAfD882jhhhXd793bLwm7eJB1ICcIJTfvU
 qgsQ==
X-Gm-Message-State: AOAM532q25kuFeUSLcMHQ4L5ckfQPokeb0aaNJ2bpcT9NtNup5fnrZHo
 eOweE+6eMFiiFfill1jP087MIng+JLk=
X-Google-Smtp-Source: ABdhPJzuk7V7ypiJ2OOFLou4Kpz/h5YWqKmojcOwdDniWhlH+bU39YHcsM1q6R/+ORSoZOisM48/XA==
X-Received: by 2002:a2e:9b08:: with SMTP id u8mr346071lji.208.1597343989272;
 Thu, 13 Aug 2020 11:39:49 -0700 (PDT)
Received: from [192.168.1.100] ([176.116.252.109])
 by smtp.gmail.com with ESMTPSA id j1sm1255393ljb.35.2020.08.13.11.39.48
 for <nouveau@lists.freedesktop.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 13 Aug 2020 11:39:48 -0700 (PDT)
From: Andrew Randrianasulu <randrianasulu@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Thu, 13 Aug 2020 21:30:28 +0300
User-Agent: KMail/1.9.10
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <202008132130.29041.randrianasulu@gmail.com>
Subject: [Nouveau] vp3 hang on mplayer exit (for GT240 videocard) -
 workaround found?
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Apparently, this hang can be fixed at small performance cost by setting

NOUVEAU_VP3_DEBUG_FENCE 1 (as opposed to default 0)
in https://cgit.freedesktop.org/mesa/mesa/tree/src/gallium/drivers/nouveau/nouveau_vp3_video.h

Now, what exactly fixes my hangs (or make them less severe) - still open question, 
guess I can flip few of those debug defines and try to find out ...

Currently at mesa Mesa 20.3.0-devel (git-8557b1a8eb)

I can launch two of those VIDEO:  [H264]  1920x1080  0bpp  59.940 fps and it will not hang
Even survived 5 x 1080p h264 (30 fps) videos - it was slideshow (due to DRI_PRIME ?)
but it does not hang ....


_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
