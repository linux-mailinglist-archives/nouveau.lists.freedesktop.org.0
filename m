Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E2F73FDE6
	for <lists+nouveau@lfdr.de>; Tue, 27 Jun 2023 16:34:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A22710E2FC;
	Tue, 27 Jun 2023 14:34:44 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 904 seconds by postgrey-1.36 at gabe;
 Wed, 21 Jun 2023 03:20:51 UTC
Received: from sender3-pp-o99.zoho.com (sender3-pp-o99.zoho.com
 [136.143.184.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A6F610E3A9
 for <nouveau@lists.freedesktop.org>; Wed, 21 Jun 2023 03:20:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1687316744; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=jhjs1HKvCWBR0DQOy6JD4E0KP4tPI8sZ2vcIpxJ3pvOUGigmxcMV0uaahTcdVNR0Rc6W5GNHyJsq1jf4tIm5vdd0TfsG1vmXrr9BLZJndt8gEwVOZnnpaZA55POye2SGBtbWG8FUihZfah9yvHWGQ3XeYhcEfM4woq9fmjRbX2w=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; 
 t=1687316744; h=Content-Type:Date:From:MIME-Version:Message-ID:Subject:To; 
 bh=Vv1BRMneV2hNMRs3VrkPFBcG9eQEywvaA/wnMBhUHww=; 
 b=kHphF42jutVa9bwTt7+NU+Sq1Crn6ky5BiRjpfNEW3I8IG0mn39zwok4cg7PYFx4yAjJaATwxlJVQvAL40fxMfDTu1InthXOtnHyrbcDZKhvpUFGlZbI3GiydlK6kQfNQJFdu5SLutKD6FFBiZgVZmdWbqImUFfc+Q4pwYPgh34=
ARC-Authentication-Results: i=1; mx.zohomail.com; dkim=pass  header.i=zoho.com;
 spf=pass  smtp.mailfrom=dufresnep@zoho.com;
 dmarc=pass header.from=<dufresnep@zoho.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1687316744; 
 s=zm2022; d=zoho.com; i=dufresnep@zoho.com;
 h=Date:Date:From:From:To:To:Message-Id:Message-Id:In-Reply-To:Subject:Subject:MIME-Version:Content-Type:Reply-To:Cc;
 bh=Vv1BRMneV2hNMRs3VrkPFBcG9eQEywvaA/wnMBhUHww=;
 b=QAK7jQ9q9VSsSyNIIXrDu/v7JVnGwtZe/deYg+JN6NULrgb9GdH27rzkIFZqZNEM
 Lmzh0yMDU7pcZA5u4hUD5SmCA9rmtPKUkbRq20HaYbHVpttgwhEYSztkXSkg+JdJ8sy
 7BOD4JbBnRp39KFJboQ6u+j5E8PEL/SaRw8r3ZgQ=
Received: from mail.zoho.com by mx.zohomail.com
 with SMTP id 1687316739163127.55957013002626;
 Tue, 20 Jun 2023 20:05:39 -0700 (PDT)
Received: from  [66.129.153.16] by mail.zoho.com
 with HTTP;Tue, 20 Jun 2023 20:05:39 -0700 (PDT)
Date: Tue, 20 Jun 2023 23:05:39 -0400
From: Paul Dufresne <dufresnep@zoho.com>
To: "nouveau" <nouveau@lists.freedesktop.org>
Message-Id: <188dbea3445.e18b117f112966.2933798857515162139@zoho.com>
In-Reply-To: 
MIME-Version: 1.0
Content-Type: multipart/alternative; 
 boundary="----=_Part_740499_1940004265.1687316739141"
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
X-Mailman-Approved-At: Tue, 27 Jun 2023 14:34:41 +0000
Subject: [Nouveau] Why drm/nouveau contains files not related to nouveau?
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

------=_Part_740499_1940004265.1687316739141
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Why nouveau-next branch on gitlab contains files not related to nouveau?



I expect that vast majority of people would get the content, only after it have been integrated to the Linux kernel (downstream from nouveau project in my mind).



Also I would mainly expect a testing branch, and a stable branch.

Only stable branch would stream down to Linux kernel I think.



People wanting to test nouveau should get a kernel, remove all nouveau files from it, then merge nouveau testing branch with their kernel, I think.
------=_Part_740499_1940004265.1687316739141
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><html><head><meta content="text/html;charset=UTF-8" http-equiv="Content-Type"></head><body ><div style="font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10pt;"><div>Why nouveau-next branch on gitlab contains files not related to nouveau?<br></div><div><br></div><div>I expect that vast majority of people would get the content, only after it have been integrated to the Linux kernel (downstream from nouveau project in my mind).<br></div><div><br></div><div>Also I would mainly expect a testing branch, and a stable branch.<br></div><div>Only stable branch would stream down to Linux kernel I think.<br></div><div><br></div><div>People wanting to test nouveau should get a kernel, remove all nouveau files from it, then merge nouveau testing branch with their kernel, I think.<br></div><div><br></div><div><br></div><div><br></div></div><br></body></html>
------=_Part_740499_1940004265.1687316739141--

