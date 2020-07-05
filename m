Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DCA8214AFA
	for <lists+nouveau@lfdr.de>; Sun,  5 Jul 2020 09:41:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D41526EBF6;
	Sun,  5 Jul 2020 07:41:28 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 433 seconds by postgrey-1.36 at gabe;
 Sun, 05 Jul 2020 07:41:28 UTC
Received: from ec2.michaelkloos.com (ec2.michaelkloos.com
 [IPv6:2600:1f16:4be:b100:c339:bb54:64d2:a5b9])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4B2186EBF6
 for <nouveau@lists.freedesktop.org>; Sun,  5 Jul 2020 07:41:28 +0000 (UTC)
Received: from qpc.home.michaelkloos.com
 (cpe-173-88-115-50.columbus.res.rr.com [173.88.115.50])
 by ec2.michaelkloos.com (Postfix) with ESMTPSA id 59E2C8575FA
 for <nouveau@lists.freedesktop.org>; Sun,  5 Jul 2020 07:34:12 +0000 (UTC)
To: nouveau@lists.freedesktop.org
From: "Michael T. Kloos" <michael@michaelkloos.com>
Message-ID: <8e6b4c97-41fa-ffaa-3580-1eee8d7d54f3@michaelkloos.com>
Date: Sun, 5 Jul 2020 03:34:11 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
Content-Language: en-US
Subject: [Nouveau] Framebuffer double buffering (via FBIOPAN_DISPLAY)
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
Content-Type: multipart/mixed; boundary="===============0359960058=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--===============0359960058==
Content-Type: multipart/alternative;
 boundary="------------FDE9095653B137677652E801"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------FDE9095653B137677652E801
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Does NOUVEAU support mmaping a double-sized Framebuffer?
When attempting to run, where fd refers to "/dev/fb0":

mmap(ptr, screensize * 2, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);

I get back an invalid argument error.  This doesn't happen if I only
request a single screensize.  Is this a limitation of the driver?


--------------FDE9095653B137677652E801
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <pre>Does NOUVEAU support mmaping a double-sized Framebuffer?
When attempting to run, where fd refers to "/dev/fb0":

mmap(ptr, screensize * 2, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);

I get back an invalid argument error.  This doesn't happen if I only 
request a single screensize.  Is this a limitation of the driver?
</pre>
  </body>
</html>

--------------FDE9095653B137677652E801--

--===============0359960058==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0359960058==--
