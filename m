Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E33E89CFE51
	for <lists+nouveau@lfdr.de>; Sat, 16 Nov 2024 11:46:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D33DC10E2E5;
	Sat, 16 Nov 2024 10:46:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gnu.org header.i=@gnu.org header.b="ir7VubWj";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from eggs.gnu.org (eggs.gnu.org [209.51.188.92])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F142B10E2E5
 for <nouveau@lists.freedesktop.org>; Sat, 16 Nov 2024 10:46:20 +0000 (UTC)
Received: from fencepost.gnu.org ([2001:470:142:3::e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <davidh@gnu.org>) id 1tCGJo-0000ge-5z
 for nouveau@lists.freedesktop.org; Sat, 16 Nov 2024 05:46:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=gnu.org;
 s=fencepost-gnu-org; h=Subject:To:From:MIME-Version:Date:in-reply-to:
 references; bh=H9yHMMw0LHMopLyy7R7suvWArmwdAXUqAHk5fmEwHLc=; b=ir7VubWjH8KvNo
 aydI96MRFynB50nYYzxg1NTZCGRIltKgh6+VDgVMxFAf0n6u4zl90MPqNiUvXmXfHaB0xHNfH5Ix1
 eNg+Bk9Lo0HDxdgEB+zjZHELxOl4KO1bNVAAB36CvlX5/k9Iu/x/J0dSoNsGRiJn0JBFb4Zjpre5Z
 VvXZumDAKc/SNDbBXaqdUv1BQqiJhfOXV58i41R9IpUss+uwTmOQkVxdEei4QIwhrYZhay76c+Mqv
 hZbPsWL6yEqfV0m9JdOvWe0WVziIiiS92myeD+IxhjcGEumw7IgtxwUXRXLx2I/1d6jkXz9f3wh4h
 zY5TQ+ezF5sr5/jC9Zkw==;
Content-Type: multipart/alternative;
 boundary="------------thf3mM1wYbKEu0WjilX0hsWe"
Message-ID: <fd47cda6-e120-4849-b77b-b58802eb2b9f@gnu.org>
Date: Sat, 16 Nov 2024 11:44:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: David Hedlund <davidh@gnu.org>
To: nouveau@lists.freedesktop.org
Subject: Inquiry on Nouveau driver compatibility and documentation updates
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

This is a multi-part message in MIME format.
--------------thf3mM1wYbKEu0WjilX0hsWe
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear Nouveau community,I have a few inquiries regarding Nouveau driver 
compatibility and documentation:

 1. Is there a comprehensive list of graphics cards compatible with
    Trisquel 11.0.1 and the Nouveau driver?[1]
 2. Would it be beneficial to include version compatibility information
    in the tables on the CodeNames page
    (https://nouveau.freedesktop.org/CodeNames.htm
    <https://nouveau.freedesktop.org/CodeNames.htm>)?
 3. The CodeNames page suggests using |dmesg | grep -i chipset|to
    identify the chipset. However, this command yields no output on my
    system. I found that |lspci -v | grep -A 12 VGA|provides the
    necessary information. Could this alternative command be added to
    the documentation for users experiencing similar issues?

|
|

Thank you for your attention to these matters. Your assistance in 
improving the documentation and clarifying compatibility information 
would be greatly appreciated.

References:

|1: |Nouveau-related packages installed on my system:

$ dpkg -l | grep nouveau
ii  libdrm-nouveau2:amd64 
2.4.113-2~ubuntu0.22.04.1                             amd64 Userspace 
interface to nouveau-specific kernel DRM services -- runtime
ii  libdrm-nouveau2:i386 
2.4.113-2~ubuntu0.22.04.1                             i386 Userspace 
interface to nouveau-specific kernel DRM services -- runtime
ii  xserver-xorg-video-nouveau 
1:1.0.17-2build1                                      amd64 X.Org X 
server -- Nouveau display driver


--------------thf3mM1wYbKEu0WjilX0hsWe
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html data-lt-installed="true">
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body style="padding-bottom: 1px;">
    <span>Dear Nouveau community,</span><span class="mt-md block"></span>
    <span>I have a few inquiries regarding Nouveau driver compatibility
      and documentation:</span>
    <ol class="marker:text-textOff list-decimal pl-8">
      <li><span>
        </span><span><span>Is there a comprehensive list of graphics
            cards compatible with Trisquel 11.0.1 and the Nouveau
            driver?[1]</span></span></li>
      <li><span>
        </span><span><span>Would it be beneficial to include version
            compatibility information in the tables on the CodeNames
            page (</span><span><a target="_blank"
              rel="nofollow noopener"
class="break-word hover:text-super hover:decoration-super dark:hover:text-superDark dark:hover:decoration-superDark underline decoration-from-font underline-offset-1 transition-all duration-300 moz-txt-link-freetext"
              href="https://nouveau.freedesktop.org/CodeNames.htm">https://nouveau.freedesktop.org/CodeNames.htm</a></span><span>)?</span></span><span>
        </span></li>
      <li><span>
        </span><span><span>The CodeNames page suggests using </span><span><code>dmesg
              | grep -i chipset</code></span><span> to identify the
            chipset. However, this command yields no output on my
            system. I found that </span><span><code>lspci -v | grep -A
              12 VGA</code></span><span> provides the necessary
            information. Could this alternative command be added to the
            documentation for users experiencing similar issues?</span></span></li>
    </ol>
    <p><code><br>
      </code></p>
    <p><span>Thank you for your attention to these matters. Your
        assistance in improving the documentation and clarifying
        compatibility information would be greatly appreciated.</span></p>
    <span><span>References:</span></span>
    <p><code>1: </code><span>Nouveau-related packages installed on my
        system:</span>
    </p>
    <p></p>
    <p>$ dpkg -l | grep nouveau<br>
      ii  libdrm-nouveau2:amd64                        
      2.4.113-2~ubuntu0.22.04.1                             amd64       
      Userspace interface to nouveau-specific kernel DRM services --
      runtime<br>
      ii  libdrm-nouveau2:i386                         
      2.4.113-2~ubuntu0.22.04.1                             i386        
      Userspace interface to nouveau-specific kernel DRM services --
      runtime<br>
      ii  xserver-xorg-video-nouveau                   
      1:1.0.17-2build1                                      amd64       
      X.Org X server -- Nouveau display driver</p>
    <p>
      <span><br>
      </span>
    </p>
  </body>
  <lt-container></lt-container>
</html>

--------------thf3mM1wYbKEu0WjilX0hsWe--
