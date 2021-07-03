Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 661B43BA7F7
	for <lists+nouveau@lfdr.de>; Sat,  3 Jul 2021 11:00:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C5E56E1BD;
	Sat,  3 Jul 2021 09:00:11 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-41103.protonmail.ch (mail-41103.protonmail.ch
 [185.70.41.103])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB1696E1BD
 for <nouveau@lists.freedesktop.org>; Sat,  3 Jul 2021 09:00:09 +0000 (UTC)
Received: from mail-0301.mail-europe.com (mail-0301.mail-europe.com
 [188.165.51.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by mail-41103.protonmail.ch (Postfix) with ESMTPS id 4GH5WD2kKbz4xHxJ
 for <nouveau@lists.freedesktop.org>; Sat,  3 Jul 2021 09:00:08 +0000 (UTC)
Authentication-Results: mail-41103.protonmail.ch;
 dkim=pass (2048-bit key) header.d=emersion.fr header.i=@emersion.fr
 header.b="uKToOwdJ"
Date: Sat, 03 Jul 2021 09:00:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1625302803;
 bh=bh7EqPBSxD7P0sFIwjUGPVXk5inH7QT2SLxv4vJUnxM=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=uKToOwdJAXk/AVaBEn+cTXOICdi8xkNcy99a/jle7KDl2C/uUR21XDBgTQXZ/UhQH
 3rNoExoJaLw8yoB2rhCXAfb8kJJ8tnX9ouE5qEWyn0nblI/zD7lM3btLFqnzaSlq7z
 25qB6N+e4aEdrL2hIMzoqRSC8Yhya0tv9UzyTwbg16N2r7Qg+tIX959cC80NTAXLfi
 ysVmtIRvdzeyya//7XvBdQIPn4RcRDHJtjoZs8HdTnb6EhOhSN7qoTWTMOoHTjy43p
 vggHDpukZ8RjVcyuG7cS+CpJdGw36Nlk+9DBGrRqAKipWyZBUzvDJFi2dLHQJMxYwr
 cdR1lQug1hCdQ==
To: gushengxian <gushengxian507419@gmail.com>
From: Simon Ser <contact@emersion.fr>
Message-ID: <anhfX5shNJsdNd6vWMeQqNTawyT0AGuoZYI7yRItB-il7fywDu9_Ie1kKL7Wwv2ecVxiYaoymsZHpufnuxUBqvja2uq0_t-Qmhhc4uHT5f0=@emersion.fr>
In-Reply-To: <20210703072502.646239-1-gushengxian507419@gmail.com>
References: <20210703072502.646239-1-gushengxian507419@gmail.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
Subject: Re: [Nouveau] [PATCH] include/uapi/drm: fix spelling mistakes in
 header files
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
Cc: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
 lima@lists.freedesktop.org, airlied@linux.ie, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, maarten.lankhorst@linux.intel.com,
 linux-kernel@vger.kernel.org, mripard@kernel.org, yuq825@gmail.com,
 daniel@ffwll.ch, gushengxian <gushengxian@yulong.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Reviewed-by: Simon Ser <contact@emersion.fr>

But this this touches a lot of different drivers, not sure we can just
merge this via drm-misc-next?

In any case, please ping me again in a week if this hasn't been merged
by then.
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
