Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD2458B062
	for <lists+nouveau@lfdr.de>; Fri,  5 Aug 2022 21:26:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 967D69B404;
	Fri,  5 Aug 2022 19:25:58 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 368 seconds by postgrey-1.36 at gabe;
 Fri, 05 Aug 2022 19:25:50 UTC
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org
 [IPv6:2001:67c:2050:0:465::202])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBC2F9B370
 for <nouveau@lists.freedesktop.org>; Fri,  5 Aug 2022 19:25:50 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4LzwQJ6RZvz9sTC
 for <nouveau@lists.freedesktop.org>; Fri,  5 Aug 2022 21:19:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=owenh.net; s=MBO0001; 
 t=1659727176;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=yUOKcI07XkCb2Ojz03WHVuisJQnzbal0+Ar4iZ10Cpo=;
 b=Ktzoa0ShMaFrlTAvSTCDpt1hdKL/8Mlc3FFsMnrmVnU4wDlHV9PGQHnBK0+OD2vcxJHLBJ
 s/RQJUY76KTdRDw1n7z9hKLrwhLruE5qhNBpaozWo94iLTLt6eQ82JpWRtRoRV37lCnijh
 NEnyhK4ydXwEOMKwjQTaNPqeDQT4eJTZjSZFbLxdzRxBQlHAfDGSMx9KTnUzKh4WjL3R6d
 +ESIEfmeLefEp+cnxasNAoYD6IJFBNWbjaPl2snZDCU5z5b+ZuASj9JFON4d6U8swI6mJh
 Dx52+5qt9o9Wyni5kxDnh/TY3FftqkDshh28Lr57AbNiSxRKRDCbaHLF5B2uDw==
Message-ID: <9b2ef542-6d6e-1068-290b-f5e166665edd@owenh.net>
Date: Fri, 5 Aug 2022 14:19:30 -0500
MIME-Version: 1.0
To: nouveau@lists.freedesktop.org
Content-Language: en-US
From: "Owen T. Heisler" <writer@owenh.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: [Nouveau] Developer access to wiki repository
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

Hi,

I would like to contribute some updates to the nouveau wiki. For that 
purpose, I would like to push a temporary branch to the 
<https://gitlab.freedesktop.org/nouveau/wiki> repository so I can open a 
merge request there. Is it possible to get developer access to that 
repository so I can do so?

Thank you,
Owen

--
Owen T. Heisler
Technical writer and consultant
https://owenh.net
