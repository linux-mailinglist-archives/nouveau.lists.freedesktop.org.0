Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8023D14FCD4
	for <lists+nouveau@lfdr.de>; Sun,  2 Feb 2020 12:09:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB6916EAA1;
	Sun,  2 Feb 2020 11:09:24 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 519 seconds by postgrey-1.36 at gabe;
 Sun, 26 Jan 2020 22:09:47 UTC
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org
 [IPv6:2001:67c:2050::465:101])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE0766E279
 for <nouveau@lists.freedesktop.org>; Sun, 26 Jan 2020 22:09:47 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:2:0])
 (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 485Rf932R0zKmTw
 for <nouveau@lists.freedesktop.org>; Sun, 26 Jan 2020 23:01:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
 content-transfer-encoding:mime-version:content-type:content-type
 :date:date:from:from:subject:subject:message-id:received; s=
 mail20150812; t=1580076063; bh=2yPE8VwcFTzTryVYlsf9DyJW/VpzHH8KM
 TuENOX+HUM=; b=xbKvQWwz1S0jcHAvCFcyoVmOWcfKGNt8D+qIJ1j2ftNF5AfVC
 qaakHnqfcwf94uFOp/oe4uknz/VTMbLS5sg0hI5vjVl7pKaXOw3FBokMmT7gh4x6
 Vdu8u4dUVqid5D2rXyDsT0fBfSyWIuD4g6GVzyM1PjkB1u04ceGv6Y5f4mEJY07y
 HvlkpDj3yUD4/PJhxRCZiUst6R9rgcJLnlQZfJrC02wjAedIjX2JE6r0ry3+fhyp
 dgHpFBXrNFiFAPdSDQAj8KZNbF/woOfGk/LKqf1iMjnTX+4Ls+C4hT4UX7Jyn6hi
 JeuvoR7Ka6Vha79PgHCcB2znkL9GF9mk1xklQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1580076063;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=IHSUJwQ3JuV4w5ArfWxikiAAukaS0FqJpaEr9Rh+K0Y=;
 b=hrz4XVwwou/0s6KaQY/AoV7VuquFxnfJ6um1b4WvaIBEPJOPQm+nJsKFvdoR5ILmkrscdC
 r5EqJxqTNvf2E6DaLqLV7EzY+c+XIrcdjXr6/KETzzR1ad44LyO8ZEWhEbO13xzZjwr1kX
 BRUUfbdYdHYXpHh/dqIxDmBTNPP9veCgtUc2RF9CVLt25KGMZRfNutWsh+uJEOGGjY6nDk
 QIvS3N8SHOVCrwaIieuABGO1S9bo7ZepTVyMVZaWRfTbJ+TxYWP+W6iFLagkfSGVEm+Ooc
 U9eHM8u1EXa5Nemy26rOv1vLrC/MEEvUN8WV9KeQuoS9HgO9aWL3zBNAlTEfyw==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
 by spamfilter02.heinlein-hosting.de (spamfilter02.heinlein-hosting.de
 [80.241.56.116]) (amavisd-new, port 10030)
 with ESMTP id QMwdmM33hB08 for <nouveau@lists.freedesktop.org>;
 Sun, 26 Jan 2020 23:01:03 +0100 (CET)
Message-ID: <608e9087bdb9d18d661912e9704d6d563e510865.camel@mailbox.org>
From: Dennis den Brok <ddb@mailbox.org>
To: nouveau@lists.freedesktop.org
Date: Sun, 26 Jan 2020 23:01:02 +0100
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 02 Feb 2020 11:09:23 +0000
Subject: [Nouveau] Firmware required?
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

Dear nouveau@,

please forgive me if this is a FAQ or otherwise obvious; it isn't to me
from searching the web, the nouveau mailing list archives and various
Linux distributions' wiki pages.

I'd like to know for which nvidia GPUs a firmware binary blob needs to
be loaded to the GPU in order for nouveau to work with it, including
binaries from what is often called "linux-firmware".  Hopefully more
precisely:

Are there GPUs supported by nouveau which do not work at all without a
binary blob?

Are there GPUs which work partially without a firmware binary blob? 
What are the restrictions?

Are there GPUs which work without restrictions?

If there is a resource with answers to my questions, I'd be grateful
for a reference.

Please CC me, as I am not subscribed to the list.

Thanks and regards,

Dennis den Brok





_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
