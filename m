Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6D6713BAA
	for <lists+nouveau@lfdr.de>; Sun, 28 May 2023 20:34:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 467C410E0F0;
	Sun, 28 May 2023 18:34:52 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from lilac.mail.einfra.hu (lilac.mail.einfra.hu
 [IPv6:2001:738:0:415::6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B24310E0F0
 for <nouveau@lists.freedesktop.org>; Sun, 28 May 2023 18:34:50 +0000 (UTC)
Received: from [2a02:ab88:38c:6f80:31fb:e6cb:e0fd:bc4a] (helo=fin)
 by lilac.mail.einfra.hu with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <wferi@niif.hu>) id 1q3LE3-0004cS-32
 for nouveau@lists.freedesktop.org; Sun, 28 May 2023 20:34:43 +0200
Received: from wferi by fin with local (Exim 4.94.2)
 (envelope-from <wferi@niif.hu>) id 1q3LE2-00081j-CO
 for nouveau@lists.freedesktop.org; Sun, 28 May 2023 20:34:42 +0200
Resent-To: nouveau@lists.freedesktop.org
Resent-From: =?utf-8?Q?Ferenc_W=C3=A1gner?= <wferi@niif.hu>
Resent-Date: Sun, 28 May 2023 20:34:42 +0200
Resent-Message-ID: <87zg5ojoe5.fsf@fin.soreny>
Received: from linzer.ki.iif.hu ([unix socket])
 by linzer (Cyrus git2.4.17+0-Debian-2.4.17+nocaldav-0+deb8u2) with LMTPA;
 Sat, 27 May 2023 22:09:01 +0200
X-Sieve: CMU Sieve 2.4
Received: from lilac.mail.einfra.hu (lilac.mail.einfra.hu
 [IPv6:2001:738:0:415::6])
 by linzer.ki.iif.hu (Postfix) with ESMTPS id 3DE2F4060C2
 for <wferi@niif.hu>; Sat, 27 May 2023 22:09:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=niif.hu; s=dkim;
 t=1685218141;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=DzAp/jve1zp43u5fpxQ4w83Zi7kQvSCMWZiv+XXUqxM=;
 b=J6i86MVoC42YleUWIFnI2mNJasVv3dmAhx4w8ajgi1s6d0DNQ7GYpQplvls2K33q6SlGpE
 YanGSgDK6GJTBaXz0OjzuoxEuSF4pxBUuaAH/Qw8kbR5m09W9o2s7y5D59VVfbEQevyc1D
 pHzDsFi+YvcBmIzaBPbc6LiunZs5E14zHyHgUAs2rh1JAxMptvDUeDVff8KU/U5vQKjQNJ
 OU3fktneyBd2XTerBRt7je9/Kq0Futrg+kd7b/QA63cSZpjsw0Tdhama5TVWZcFmWPgM2F
 xWoGlcxQBDsIai6BvHDF/tg4p8V44NoGrVGsu8l+F9dIuPhpu0CIL6iO4d+6SA==
Received: from [2a02:ab88:38c:6f80:7012:8c25:ce40:6164] (helo=fin)
 by lilac.mail.einfra.hu with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <wferi@niif.hu>)
 id 1q30Dk-0002hA-FB; Sat, 27 May 2023 22:09:00 +0200
Received: from wferi by fin with local (Exim 4.94.2)
 (envelope-from <wferi@niif.hu>)
 id 1q30Di-0003dJ-Kh; Sat, 27 May 2023 22:08:58 +0200
From: =?utf-8?Q?Ferenc_W=C3=A1gner?= <wferi@niif.hu>
To: nouveau@lists.freedesktop.org
Date: Sat, 27 May 2023 22:08:58 +0200
Message-ID: <875y8dlep1.fsf@fin.soreny>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Subject: [Nouveau] Powering down laptop GPU TU117GLM
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

Sorry if I'm reaching the wrong forum, please advise if so.  My question
is not about the main focus of this community, but I had no better idea
about where to look for the relevant expertise.

So: this Dell Precision 5560 laptop is built with a "T1200 Laptop GPU",
and I suspect it draws power even though I don't ever use it, heating
the computer and shortening battery life.  Is there a way to shut it
down for good?  (Or to make sure it isn't causing my problems?)
-- 
Thanks,
Feri.
